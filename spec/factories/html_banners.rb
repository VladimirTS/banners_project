FactoryGirl.define do
  factory :html_banner do
    controller "ExamplesController"
    action     "Action"
    html       "Html"
  end
end