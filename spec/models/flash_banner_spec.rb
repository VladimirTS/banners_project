require 'rails_helper'

describe FlashBanner do

  let(:flash_banner) do
    flash_banner =  FactoryGirl.create(:flash_banner)
    flash_banner.positions = [ Position.new(value: "top"), Position.new(value: "bottom")]
    flash_banner.save
    flash_banner
  end

  subject { flash_banner }

  it { should respond_to(:controller) }
  it { should respond_to(:action) }
  it { should respond_to(:property_type) }
  it { should respond_to(:deal_kind)}

  it { should respond_to(:deal_direction) }
  it { should respond_to(:count_display)}
  it { should respond_to(:positions)}
  it { should respond_to(:file)}

  it { should be_valid }


end