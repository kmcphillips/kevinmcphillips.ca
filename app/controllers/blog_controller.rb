class BlogController < ApplicationController

  def index
    @title = "Blog"
    @posts = Post.sorted.page(params[:page]).per(5)
  end

  def show
    @post = Post.find_by_permalink! params[:id]
    @title = @post.title
  end

  def feed
    @posts = Post.sorted

    respond_to do |wants|
      wants.rss do
        render layout: false
      end
    end
  end
  
end
