class HtmlBanner < ActiveRecord::Base
  acts_as :banner, :as => :producible

  validates :html, presence: true
end