require "#{File.dirname(__FILE__)}/spec_helper"

describe 'Application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "action" do
    it 'should show the default index page' do
      get '/'
      last_response.should be_ok
    end
    
    it "should test the css/sass" do
      pending
    end
    
    PAGES.each do |page|
      it "should route /#{page}" do
        get "/#{page}"
        last_response.should be_ok
      end
    end
  end

  describe "extension" do
    before(:each) do
      @hash = {:pie => "delicious", "cake" => "moist"}
      @hash_stringified = {"pie" => "delicious", "cake" => "moist"}
    end
    
    describe "stringify_keys" do
      it "should return an altered hash" do
        @hash.stringify_keys.should == @hash_stringified
        @hash[:pie].should be_an_instance_of(String)
      end
    end
    
    describe "stringify_keys!" do
      it "should alter the hash in place" do
        @hash.stringify_keys!
        @hash.should == @hash_stringified
        @hash[:pie].should be_nil
      end
    end
  end
  
  describe "helpers" do
    it "should test link_to" do
      pending
    end
  
    it "should test image_tag" do
      pending
    end
    
    it "should test render" do
      pending
    end
    
    it "should test rot13email" do
      pending
    end
  end
end
