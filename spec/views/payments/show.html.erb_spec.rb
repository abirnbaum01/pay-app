require 'spec_helper'

describe "payments/show" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :email => "Email",
      :description => "Description",
      :amount => "9.99",
      :frequency => "Frequency",
      :paid => "Paid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
    rendered.should match(/Frequency/)
    rendered.should match(/Paid/)
  end
end
