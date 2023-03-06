# spec/views/home/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe "home/index", type: :view do
  before do
    assign(:total_images, 10)
    assign(:threads, 3)
    assign(:amount, 10)
    assign(:images, [])
  end

  context "when the view is rendered" do
    it "displays the correct number of extracted images" do
      render
      expect(rendered).to have_content("Total Extracted Images")
    end

    it "displays the current threads quantity" do
      render
      expect(rendered).to have_selector('#threads', text: '1')
    end

    it "displays the amount of images to download" do
      render
      expect(rendered).to have_selector('#amount', text: '1')
    end

    it "displays the administration section" do
      render
      expect(rendered).to have_content("Admin")
    end

    it "displays the images section" do
      render
      expect(rendered).to have_content("Show me those memes!")
    end
  end

  context 'when there are no images' do
    before do
      assign(:images, [])
      assign(:total_images, 0)
      assign(:threads, 1)
      assign(:amount, 1)
    end

    it 'displays the correct title and message' do
      render

      expect(rendered).to have_selector('h1', text: 'Image Extractor')
      expect(rendered).to have_selector('.display-2', text: '0')
      expect(rendered).to have_selector('.card-title', text: 'Current Threads')
      expect(rendered).to have_selector('.card-title', text: 'Download images')
      expect(rendered).to have_selector('.btn-danger', text: 'Remove all images')
      expect(rendered).to have_selector('.carousel-item', count: 0)
      expect(rendered).to have_selector('h1', text: 'Images')
    end
  end

  context 'when there are images' do
    before do
      assign(:total_images, 3)
      assign(:threads, 2)
      assign(:amount, 5)
    end

    it 'displays the correct title and message' do
      render

      expect(rendered).to have_selector('h1', text: 'Image Extractor')
      expect(rendered).to have_selector('.display-2', text: '3')
      expect(rendered).to have_selector('.card-title', text: 'Current Threads')
      expect(rendered).to have_selector('.card-title', text: 'Download images')
      expect(rendered).to have_selector('.btn-danger', text: 'Remove all images')
      expect(rendered).to have_selector('h1', text: 'Images')
    end
  end
end
