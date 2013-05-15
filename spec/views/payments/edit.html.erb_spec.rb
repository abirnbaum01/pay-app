require 'spec_helper'

describe "payments/edit" do
  before(:each) do
    @payment = assign(:payment, stub_model(Payment,
      :email => "MyString",
      :description => "MyString",
      :amount => "9.99",
      :frequency => "MyString",
      :paid => "MyString"
    ))
  end

  it "renders the edit payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path(@payment), :method => "post" do
      assert_select "input#payment_email", :name => "payment[email]"
      assert_select "input#payment_description", :name => "payment[description]"
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_frequency", :name => "payment[frequency]"
      assert_select "input#payment_paid", :name => "payment[paid]"
    end
  end
end
