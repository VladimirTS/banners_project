class BaseBannerForm
  attr_reader :banner

  include Virtus.model

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations


  # define Virtus accessors
  attribute :controller, String
  attribute :property_type, String
  attribute :deal_direction, String
  attribute :deal_kind, String
  attribute :positions, String

  validates :controller, presence: true


  def initialize(banner)
    if banner.instance_of?(ImageBanner) || banner.instance_of?(FlashBanner) ||
                                           banner.instance_of?(HtmlBanner)
      @banner = banner
    else
      super
    end
  end

  def persisted?
    false
  end

  def update_attributes(params)
    self.attributes = params
    if valid?
      update!
      true
    else
      false
    end
  end

  def self.destroy(banner)
    banner.destroy
  end

  private

    def update!
      p "=================="
      @banner.positions = positions.map { |pos| Position.new(value: pos) }
      @banner.update_attributes(model_attributes)
    end
end