class HtmlForm < BaseBannerForm

  attribute :html, String

  validates :html, presence: true

  def model_attributes
    { controller:     controller,
      property_type:  property_type,
      deal_direction: deal_direction,
      deal_kind:      deal_kind,
      html:           html }
  end

  def save
    if valid?
      persist!
      true
    else
      @banner = HtmlBanner.new(model_attributes)
      false
    end
  end

  private

    def persist!
      @banner = HtmlBanner.new(model_attributes)
      @positions = positions.map { |pos| Position.new(value: pos) }
      @banner.positions = @positions
      @banner.save!
    end
end