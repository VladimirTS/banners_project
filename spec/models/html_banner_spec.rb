require 'rails_helper'

describe HtmlBanner do

  let(:html_banner) do
    html_banner =  FactoryGirl.create(:html_banner)
    html_banner.positions = [ Position.new(value: "top"), Position.new(value: "bottom")]
    html_banner.save
    html_banner
  end

  subject { html_banner }

  it { should respond_to(:controller) }
  it { should respond_to(:action) }
  it { should respond_to(:property_type) }
  it { should respond_to(:deal_kind)}

  it { should respond_to(:deal_direction) }
  it { should respond_to(:count_display)}
  it { should respond_to(:positions)}
  it { should respond_to(:html)}

  it { should be_valid }


end