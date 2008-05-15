require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Radios" do
  
  before :all do
    @browser = IE.new
    add_spec_checker(@browser)    
  end

  before :each do
    @browser.goto(TEST_HOST + "/forms_with_input_elements.html")
  end
  
  describe "#length" do
    it "should return the number of radios" do
      @browser.radios.length.should == 5
    end
  end
  
  describe "#[]" do
    it "should return the radio button at the given index" do
      @browser.radios[1].id.should == "new_user_newsletter_yes"
    end
  end
  
  describe "#each" do
    it "should iterate through radio buttons correctly" do
      index = 1
      @browser.radios.each do |r|
        r.name.should == @browser.radio(:index, index).name
        r.id.should ==  @browser.radio(:index, index).id
        r.value.should == @browser.radio(:index, index).value
        index += 1
      end
      @browser.radios.length.should == index - 1
    end
  end

  after :all do
    @browser.close
  end
  
end
