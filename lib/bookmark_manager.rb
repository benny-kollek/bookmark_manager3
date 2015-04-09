require 'sinatra/base'
require 'byebug'
# comment
class BookmarkManager < Sinatra::Base
  set :views, Proc.new { File.join(root,"..", "views")}
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/links')
  end

  get '/links' do
    'Welcome, ' + User.first(id: session[:user_id]).email
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
