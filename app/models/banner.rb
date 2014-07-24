class Banner < ActiveRecord::Base
  has_many   :positions
  belongs_to :ban, polymorphic: true
end