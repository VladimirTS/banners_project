class Position < ActiveRecord::Base
  #belongs_to :banner

  has_and_belongs_to_many :banners
end