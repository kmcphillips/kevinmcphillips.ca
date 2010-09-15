require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Post Model" do
  describe 'path' do
    it 'should know its path' do
      Post.new(:permalink => "pie").path.should == "/blog/pie"
    end
  end

  describe 'set_permalink' do
    it 'should be tested' do
      pending
    end
  end
end
