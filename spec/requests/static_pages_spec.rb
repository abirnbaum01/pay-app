require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'PayMonkey'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'PayMonkey')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "PayMonkey | Home")
    end
  end

  describe "About page" do

    it "should have the h1 'About'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "PayMonkey | About")
    end
  end

end

