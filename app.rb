class KevinMcphillipsApp < Sinatra::Base
  set :haml, format: :html5

  get '/' do
    haml :index
  end

  get '/stylesheet.css' do
    scss :stylesheet
  end

end
