class BlocksController < ApplicationController

  def bio
    @title = "Bio"
  end

  def resume
    @title = "Resume"
  end

  def code
    @title = "Code"
  end

  def projects
    @title = "Projects"
    @projects = Project.sorted
  end

end
