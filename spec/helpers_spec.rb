require "#{File.dirname(__FILE__)}/spec_helper"

describe 'Helpers' do
  describe "link_to" do
    it "should link without a url" do
      link_to("pie").should == "<a href=\"pie\">pie</a>"
    end
  
    it "should link with a url" do
      link_to("pie", "http://pie.delicious").should == "<a href=\"http://pie.delicious\">pie</a>"
    end
  
    it "should link with options" do
      link_to("pie", "http://pie.delicious", :name => "Delicious Pie").should == "<a href=\"http://pie.delicious\" name=\"Delicious Pie\">pie</a>"    
    end
  end

  describe "image_tag" do
    it "should generate from a url" do
      image_tag("image/path").should == "<img src=\"image/path\" />"
    end
    
    it "should generate from a url with options" do
      image_tag("image/path", :alt => "pie").should == "<img alt=\"pie\" src=\"image/path\" />"
    end
  end

  describe "render" do
    it "should render a partial with object" do
      should_receive(:haml).with("_delicious".to_sym, :layout => false).and_return("pie")
      render(:partial => "delicious").should == "pie"
    end
    
    it "should render a partial with object" do
      should_receive(:haml).with("_delicious".to_sym, :layout => false, :locals => {:delicious => "obj"}).and_return("pie")
      render(:partial => "delicious", :object => "obj").should == "pie"
    end
    
    it "should render a partial with locals" do
      should_receive(:haml).with("_delicious".to_sym, :layout => false, :locals => {:cake => "lie"}).and_return("pie")
      render(:partial => "delicious", :locals => {:cake => "lie"}).should == "pie"
    end

    it "should render a partial with everything" do
      should_receive(:haml).with("_delicious".to_sym, :layout => false, :locals => {:delicious => "obj", :cake => "lie"}).and_return("pie")
      render(:partial => "delicious", :object => "obj", :locals => {:cake => "lie"}).should == "pie"
    end
  end

  describe "rot13email" do
    it "should generate from an address" do
      rot13email("test@kevinmcphillips.ca").should == "<script>document.write('<a href=\"mailto:' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '\">' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '</a>');</script><noscript><a href=\"mailto:test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca\">test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca</a></noscript>"
    end
    
    it "should generate from an address and name" do
      rot13email("test@kevinmcphillips.ca").should == "<script>document.write('<a href=\"mailto:' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '\">' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '</a>');</script><noscript><a href=\"mailto:test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca\">test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca</a></noscript>"
    end
  end
end
