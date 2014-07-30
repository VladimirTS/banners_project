class ImageBanner < ActiveRecord::Base
  acts_as :banner, :as => :producible

  has_attached_file :file, styles: { medium:"250x250#",
                                     thumb: "100x100#" },
                           default_url: "/images/:style/missing.png"

  validates_attachment_content_type :file,  content_type: /^image\/(png|gif|jpeg)/
  validates  :url, url: true
  validates  :file, presence: true
end