class KevinmcphillipsCa < Padrino::Application
  register SassInitializer
  register Padrino::Mailer
  register Padrino::Helpers

  ##
  # Application configuration options
  #
  # set :raise_errors, true     # Show exceptions (default for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (defaults to app/locale/)
  # enable  :sessions           # Disabled by default
  # disable :flash              # Disables rack-flash (enabled by default if sessions)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

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

  get '/blog/:permalink' do
    @post = Post.first :permalink => params[:permalink]

    if @post
      haml :'_post', :locals => {:post => @post}
    else
      haml :'404'
    end
  end

  get "/blog.rss" do
    builder :blog
  end

  ## All other sections are pretty simple
  PAGES.each do |page|
    get "/#{page}" do
      @projects = Project.all if page == :projects    
      @title = page.to_s.humanize
      haml page
    end
  end

end

