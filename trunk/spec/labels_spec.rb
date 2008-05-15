require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Labels" do
  
  before :all do
    @browser = IE.new
    add_spec_checker(@browser)    
  end

  before :each do
    @browser.goto(TEST_HOST + "/forms_with_input_elements.html")
  end

  describe "#length" do
    it "should return the number of labels" do
      @browser.labels.length.should == 26 # changed this from 25 - Jari
    end
  end
  
  describe "#[]" do
    it "should return the pre at the given index" do
      @browser.labels[1].id.should == "first_label"
    end
  end

  describe "#each" do
    it "should iterate through labels correctly" do
      @browser.labels.each_with_index do |l, index|
        l.name.should == @browser.label(:index, index+1).name
        l.id.should == @browser.label(:index, index+1).id
        l.value.should == @browser.label(:index, index+1).value
      end
    end
  end
  
  after :all do
    @browser.close
  end

end

