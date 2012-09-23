require "spec_helper"

describe ApplicationController do
  describe "#email" do
    it "should return the expected email address" do
      controller.email.should eq("admin@kevinmcphillips.ca")
    end
  end
end
