class ImageForm < BaseBannerForm

  attribute :file, String
  attribute :url, String

  validates :url,  presence: true
  validates :file,  presence: true

  def model_attributes
    { controller:     controller,
      property_type:  property_type,
      deal_direction: deal_direction,
      deal_kind:      deal_kind,
      file:           file,
      url:            url }
  end

  def save
    if valid?
      persist!
      true
    else
      @banner = ImageBanner.new(model_attributes)
      false
    end
  end

  private

    def persist!
      @banner = ImageBanner.new(model_attributes)
      @positions = positions.map { |pos| Position.new(value: pos) }
      @banner.positions = @positions
      @banner.save!
    end
end