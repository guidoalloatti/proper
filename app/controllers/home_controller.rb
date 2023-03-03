class HomeController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'httparty'
  require 'concurrent'
  require 'fileutils'

  DEFAULT_AMOUNT = 1
  DEFAULT_THREADS = 1
  
  def index
    flash[:notice] = "Welcome to the Image Extractor!" unless flash[:alert]

    @images = Dir.glob("#{Rails.root}/public/images/*")
                 .map { |file| { name: File.basename(file), created_at: File.ctime(file) } }
                 .sort_by { |image| image[:created_at] }
                 .reverse
    @total_images = @images.size
    @amount = params[:amount].to_i || AMOUNT

    if params[:download]
      download
    end
  end

  def download
    @threads = params[:threads].to_i || DEFAULT_THREADS
    @amount = params[:amount].to_i || DEFAULT_AMOUNT

    return unless @threads > 0 && @threads < 6
    return unless @amount > 0 && @amount < 21

    # Create a thread pool with a maximum of 5 threads
    @thread_pool = Concurrent::ThreadPoolExecutor.new(
      min_threads: 1,
      max_threads: @threads,
      max_queue: 0,
      fallback_policy: :caller_runs
    )
    
    response = HTTParty.get('https://icanhas.cheezburger.com/')
    img_urls = response.body.scan(/<img [^>]*src="([^"]+).*?width="800".*?height="420"/i).flatten

    @total_images = img_urls.count
    @started_downloads = 0
    @downloaded_images = 0

    img_urls.each do |img_url|
      break unless @downloaded_images < @amount
      break unless @started_downloads < @amount

      image_name = File.basename(URI.parse(img_url).path)
      image_file = "public/images/#{image_name}"
      next if File.exist?(image_file)

      # Submit a new task to the thread pool
      @started_downloads += 1

      @thread_pool.post do
        begin
          unless File.exist?(image_file)
            File.open(image_file, 'wb') do |f|
              f.write HTTParty.get(img_url)
            end
            @downloaded_images += 1
          end
        rescue OpenURI::HTTPError, Errno::ENOENT, Errno::ENAMETOOLONG, Errno::EACCES => e
          puts "Error downloading image: #{e.message}"
        end
      end
    end

    # Wait for all tasks to complete
    @thread_pool.shutdown
    @thread_pool.wait_for_termination

    flash[:alert] = "Extraction Summary:
      Total Images to download: #{@total_images}
      | Downloads Attempted: #{@started_downloads} 
      | Images Downloaded #{@downloaded_images} 
      | Download Success Rate: #{(@downloaded_images.to_f / @started_downloads.to_f * 100.0).round(0) if @downloaded_images > 0}% 
      | Threads Requested: #{@threads} 
      | Threads Executed: #{[@amount, @threads].min()}"
    redirect_to root_path(amount: @amount)
  end

  def remove_images
    FileUtils.rm_rf(Dir.glob(Rails.public_path.join("images", "*")))
    
    flash[:alert] = "All images removed successfully!"
    redirect_to root_path
  end


  def remove_image
    file_path = "#{Rails.root}/public/images/#{params[:image][:name]}"

    if File.exist?(file_path)
      FileUtils.rm(file_path)
      flash[:alert] = "Image removed successfully!"
    else
      flash[:alert] = "Image not found."
    end

    redirect_to root_path
  end
end
