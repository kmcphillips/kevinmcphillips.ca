class KevinmcphillipsCa < Padrino::Application
  register SassInitializer
  register Padrino::Mailer
  register Padrino::Helpers

  error 404 do
    haml :'404'
  end

  ## Blog pages
  get '/' do
    redirect '/blog'
  end

  get '/blog' do
    @posts = Post.page pager_params(:page => params[:page], :order => [:created_at.desc]) 
    haml :'blog'
  end
  
  get 'feed', :provides => [:rss] do
    @posts = Post.all :order => [:created_at.desc]
    render :feed
  end

  get '/blog/:permalink' do
    @post = Post.first :permalink => params[:permalink]

    if @post
      haml :'_post', :locals => {:post => @post}
    else
      haml :'404'
    end
  end

  ## All other sections are pretty simple
  PAGES.each do |page|
    get "/#{page}" do
      @projects = Project.all(:order => [:id.desc]) if page == :projects    
      @title = page.to_s.humanize
      haml page
    end
  end

end

