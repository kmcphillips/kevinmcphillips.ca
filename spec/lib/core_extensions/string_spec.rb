require "spec_helper"

describe String do
  describe "#rot13" do
    it "should transform a simple string" do
      "abc".rot13.should eq("nop")
    end

    it "should ignore special characters and numbers" do
      str = "!@#%^&*}?><12346"
      str.rot13.should eq(str)
    end

    it "should deal with case sensitivity" do
      "aBcDeFgH".rot13.should eq("nOpQrStU")
    end
  end
end
