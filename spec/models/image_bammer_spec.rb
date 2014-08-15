require 'rails_helper'

describe ImageBanner do

  let(:image_banner) do
    image_banner =  FactoryGirl.create(:image_banner)
    image_banner.positions = [ Position.new(value: "top"), Position.new(value: "bottom")]
    image_banner.save
    image_banner
  end

  subject { image_banner }

  it { should respond_to(:controller) }
  it { should respond_to(:action) }
  it { should respond_to(:property_type) }
  it { should respond_to(:deal_kind)}

  it { should respond_to(:deal_direction) }
  it { should respond_to(:count_display)}
  it { should respond_to(:positions)}
  it { should respond_to(:file)}
  it { should respond_to(:url)}

  it { should be_valid }


end