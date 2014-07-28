class FlashBanner < ActiveRecord::Base
  acts_as_banner

  has_attached_file :file

  validates :file, presence: true
  validates_attachment_content_type :file, content_type: "application/vnd.adobe.flash.movie"

end