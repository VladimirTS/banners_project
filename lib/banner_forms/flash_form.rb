class FlashForm < BaseBannerForm

  attribute :file, File

  validates :file, presence: true

  def model_attributes
    { controller:     controller,
      property_type:  property_type,
      deal_direction: deal_direction,
      deal_kind:      deal_kind,
      file:           file }
  end

  def save
    if valid?
      persist!
      true
    else
      @banner = FlashBanner.new(model_attributes)
      false
    end
  end

  private

    def persist!
      @banner = FlashBanner.new(model_attributes)
      @positions = positions.map { |pos| Position.new(value: pos) }
      @banner.positions = @positions
      @banner.save!
    end
end