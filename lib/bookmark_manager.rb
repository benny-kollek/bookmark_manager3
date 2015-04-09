require 'sinatra/base'
# comment
class BookmarkManager < Sinatra::Base
  set :views, Proc.new { File.join(root,"..", "views")}

  get '/' do
    erb :index
  end

  get '/signup' do
    'Welcome!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
