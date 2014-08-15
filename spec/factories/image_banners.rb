FactoryGirl.define do
  factory :image_banner do
    file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/images/picture.png", "image/png")
    url "http://google.com"
  end
end