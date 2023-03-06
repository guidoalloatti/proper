require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'assigns the images variable' do
      get :index
      expect(assigns(:images)).not_to be_nil
    end

    it 'assigns the total_images variable' do
      get :index
      expect(assigns(:total_images)).not_to be_nil
    end

    it 'assigns the amount variable' do
      get :index
      expect(assigns(:amount)).not_to be_nil
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #download' do
    context 'when the parameters are valid' do
      before do
        allow(HTTParty).to receive(:get).and_return(
          double('response', body: '<img src="https://example.com/image.jpg" width="800" height="420">')
        )
      end

      it 'downloads images and redirects to index' do
        post :download, params: { amount: 1, threads: 1 }
        expect(response).to redirect_to("http://test.host/?amount=1")
      end

      it 'sets the flash message' do
        post :download, params: { amount: 1, threads: 1 }
        expect(flash[:success]).to match(/Extraction Summary:/)
      end
    end

    context 'when the parameters are invalid' do
      it 'sets the flash message' do
        post :download, params: { amount: 0, threads: 1 }
        expect(flash[:alert]).to be_nil
      end
    end
  end

  describe 'DELETE #remove_images' do
    it 'removes all images and redirects to index' do
      delete :remove_images
      expect(response).to redirect_to(root_path)
    end

    it 'sets the flash message' do
      delete :remove_images
      expect(flash[:danger]).to eq('All images removed successfully!')
    end
  end

  describe 'DELETE #remove_image' do
    let(:image_name) { 'image.jpg' }
    let(:image_path) { "#{Rails.root}/public/images/#{image_name}" }

    before do
      FileUtils.touch(image_path)
    end

    it 'removes the specified image and redirects to index' do
      delete :remove_image, params: { image: { name: image_name } }
      expect(response).to redirect_to(root_path)
      expect(File.exist?(image_path)).to be_falsey
    end

    it 'sets the flash message when the image exists' do
      delete :remove_image, params: { image: { name: image_name } }
      expect(flash[:alert]).to eq('Image removed successfully!')
    end

    it 'sets the flash message when the image does not exist' do
      delete :remove_image, params: { image: { name: 'nonexistent.jpg' } }
      expect(flash[:alert]).to eq('Image not found.')
    end
  end
end
