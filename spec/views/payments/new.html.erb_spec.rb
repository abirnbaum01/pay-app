require 'spec_helper'

describe "payments/new" do
  before(:each) do
    assign(:payment, stub_model(Payment,
      :email => "MyString",
      :description => "MyString",
      :amount => "9.99",
      :frequency => "MyString",
      :paid => "MyString"
    ).as_new_record)
  end

  it "renders new payment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payments_path, :method => "post" do
      assert_select "input#payment_email", :name => "payment[email]"
      assert_select "input#payment_description", :name => "payment[description]"
      assert_select "input#payment_amount", :name => "payment[amount]"
      assert_select "input#payment_frequency", :name => "payment[frequency]"
      assert_select "input#payment_paid", :name => "payment[paid]"
    end
  end
end
