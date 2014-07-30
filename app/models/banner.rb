class Banner < ActiveRecord::Base
  acts_as_superclass :as => :producible

  has_many   :positions, :dependent => :destroy

  validates  :controller, presence: true

  class << self

    def add_positions(positions, banner_id)
      if positions
        positions.each do |pos|
          Position.create(banner_id: banner_id, value: pos)
        end
      end
    end

    def remove_positions(banner_type)
      banner_type.banner.positions.each do |position|
        position.destroy
      end
    end

    def get_banners(params)
      # params:
      # {"controller"=>"tests", "action"=>"all_record", "property_type"=>"residential",
      # "deal_kind"=>"sale", "deal_direction"=>"offer"}

      params[:controller] = params[:controller].camelize
      banners = Banner.where(params.except(:action))

      @cur_action     = params[:action]
      @cur_controller = params[:controller].camelize

      # return arrays: top, middle, right, height
      positions = get_positions_array(banners)

      @banner_positions = { top:    get_rand_banner(positions[:top]),
                            middle: get_rand_banner(positions[:middle]),
                            right:  get_rand_banner(positions[:right]),
                            bottom: get_rand_banner(positions[:bottom]) }
    end

    def get_positions_array(banners)
      @positions = { top: [], middle: [], right: [], bottom: [] }

      banners.each do |banner|
        if (@cur_controller == banner.controller) && (banner.action.nil? || banner.action == @cur_action)

          banner.positions.each do |position|
            # position value may be top, middle, right, bottom
            @positions[position.value.to_sym]  << banner
          end
        end
      end

      @positions
    end

    def get_rand_banner(banners)
      rand_val = rand(banners.count)
      banners[rand_val]
    end

  end
end