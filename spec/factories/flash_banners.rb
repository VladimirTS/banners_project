FactoryGirl.define do
  factory :flash_banner do
    file Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/flash/flash.swf", "application/vnd.adobe.flash.movie")
  end
end