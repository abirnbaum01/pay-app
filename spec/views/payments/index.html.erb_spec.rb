require 'spec_helper'

describe "payments/index" do
  before(:each) do
    assign(:payments, [
      stub_model(Payment,
        :email => "Email",
        :description => "Description",
        :amount => "9.99",
        :frequency => "Frequency",
        :paid => "Paid"
      ),
      stub_model(Payment,
        :email => "Email",
        :description => "Description",
        :amount => "9.99",
        :frequency => "Frequency",
        :paid => "Paid"
      )
    ])
  end

  it "renders a list of payments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => "Paid".to_s, :count => 2
  end
end
