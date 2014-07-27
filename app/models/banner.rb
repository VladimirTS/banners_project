class Banner < ActiveRecord::Base

  belongs_to :ban, polymorphic: true

  has_many   :positions, :dependent => :destroy

  validates  :controller, presence: true

  class << self

    def get_banners(params)
      # params:
      # {"controller"=>"tests", "action"=>"all_record", "property_type"=>"residential",
      # "deal_kind"=>"sale", "deal_direction"=>"offer"}

      params[:controller] = params[:controller].camelize
      @all_banners    = Banner.where(params.except(:action))
      @cur_action     = params[:action]
      @cur_controller = params[:controller].camelize

      # return arrays: top, middle, right, height
      get_positions_array

      @banner_positions = { top:    get_rand_banner(@pos_top),
                            middle: get_rand_banner(@pos_middle),
                            right:  get_rand_banner(@pos_right),
                            bottom: get_rand_banner(@pos_bottom) }
    end

    def get_positions_array
      @pos_top, @pos_middle, @pos_right, @pos_bottom  = [], [], [], []

      @all_banners.each do |banner|
        if (@cur_controller == banner.controller) && (banner.action.nil? || banner.action == @cur_action)
          positions = banner.positions
          positions.each do |pos|
            if pos.value == "top"
              @pos_top << banner
            elsif pos.value == "middle"
              @pos_middle << banner
            elsif pos.value == "right"
              @pos_right << banner
            else
              @pos_bottom << banner
            end
          end
        end
      end
    end

    def get_rand_banner(banners)
      rand_val = rand(banners.count)
      banners[rand_val]
    end

  end
end