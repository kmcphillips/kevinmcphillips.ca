require "#{File.dirname(__FILE__)}/spec_helper"

describe 'Application' do

  def app
    Sinatra::Application.new
  end

  describe "action" do
    it 'should show the default index page' do
      get '/'
      last_response.should be_ok
    end
    
    it "should test the css/sass" do
      pending "I don't know how to stub this yet"
      should_receive(:content_type).with('text/css', :charset => 'utf-8')
      should_receive(:sass).with(:stylesheet)
      get '/stylesheet.css'
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
    
    describe "humanize" do
      it "should upcase only the first word" do
        "pie is delicious".humanize.should == "Pie is delicious"
      end  
      
      it "should just upcase the only word" do
        "pie".humanize.should == "Pie"
      end
      
      it "should get rid of underscores" do
        "under_score".humanize.should == "Under score"
      end
    end
    
    describe "titleize" do
      it "should upcase all words" do
        "pie is delicious".titleize.should == "Pie Is Delicious"
      end  
      
      it "should just upcase the only word" do
        "pie".titleize.should == "Pie"
      end
      
      it "should get rid of underscores" do
        "under_score".titleize.should == "Under Score"
      end
    end
    
    describe "rot13" do
      {'admin@kevinmcphillips.ca' => 'nqzva@xrivazpcuvyyvcf.pn', 
       '1234567890' => '1234567890',
       'AbCdEfGhIjKlMnOpQrStUvWxYz!@#$%^&*()_+' => 'NoPqRsTuVwXyZaBcDeFgHiJkLm!@#$%^&*()_+', 
       'Pie is delicious!' => 'Cvr vf qryvpvbhf!'
      }.each do |key, value|
        it "should convert #{key}" do
          key.rot13.should == value
        end
      end
    end
  end
end
