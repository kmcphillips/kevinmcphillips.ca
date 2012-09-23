require 'spec_helper'

describe BlocksController do
  describe "#bio" do
    it "should render the default view" do
      get :bio
      response.should render_template(:bio)
    end

    it "should set the title" do
      get :bio
      assigns[:title].should eq("Bio")
    end
  end

  describe "#code" do
    it "should render the default view" do
      get :code
      response.should render_template(:code)
    end

    it "should set the title" do
      get :code
      assigns[:title].should eq("Code")
    end
  end

  describe "#resume" do
    it "should render the default view" do
      get :resume
      response.should render_template(:resume)
    end

    it "should set the title" do
      get :resume
      assigns[:title].should eq("Resume")
    end
  end

  describe "#projects" do
    it "should render the default view" do
      get :projects
      response.should render_template(:projects)
    end

    it "should set the title" do
      get :projects
      assigns[:title].should eq("Projects")
    end

    it "should get the sorted list of projects" do
      projects = [mock_model(Project)]
      Project.should_receive(:sorted).and_return(projects)
      get :projects
      assigns[:projects].should eq(projects)
    end
  end
end
