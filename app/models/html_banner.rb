class HtmlBanner < ActiveRecord::Base
  acts_as_banner

  validates :html, presence: true
end