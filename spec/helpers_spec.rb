require "#{File.dirname(__FILE__)}/spec_helper"

describe 'Helpers' do
  describe "rot13email" do
    it "should generate from an address" do
      rot13email("test@kevinmcphillips.ca").should == "<script>document.write('<a href=\"mailto:' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '\">' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '</a>');</script><noscript><a href=\"mailto:test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca\">test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca</a></noscript>"
    end
    
    it "should generate from an address and name" do
      rot13email("test@kevinmcphillips.ca").should == "<script>document.write('<a href=\"mailto:' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '\">' + 'grfg@xrivazpcuvyyvcf.pn'.rot13() + '</a>');</script><noscript><a href=\"mailto:test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca\">test@ke[REMOVETHIS]vinmcph[REMOVETHIS]illips.ca</a></noscript>"
    end
  end
end

