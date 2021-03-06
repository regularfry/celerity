require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Divs" do
  before :all do
    @browser = Browser.new(BROWSER_OPTIONS)
  end

  before :each do
    @browser.goto(HTML_DIR + "/non_control_elements.html")
  end

  describe "#length" do
    it "returns the number of divs" do
      @browser.divs.length.should == 9
    end
  end

  describe "#[]" do
    it "returns the div at the given index" do
      @browser.divs[2].id.should == "outer_container"
    end
  end

  describe "#each" do
    it "iterates through divs correctly" do
      @browser.divs.each_with_index do |d, index|
        d.name.should == @browser.div(:index, index+1).name
        d.id.should == @browser.div(:index, index+1).id
        d.class_name.should == @browser.div(:index, index+1).class_name
      end
    end
  end

  after :all do
    @browser.close
  end

end

