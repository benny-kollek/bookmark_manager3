require 'sinatra/base'
require 'byebug'
require_relative 'database_setup'
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

  get '/signin' do
    erb :signin
  end

  post '/signin/process' do
    # Authenticate user
    if User.first(email: params[:email])
      session[:user_id] = User.first(email: params[:email]).id
    end
    redirect('/links')
  end

  get '/links' do
    if session[:user_id]
      'Welcome, ' + User.first(id: session[:user_id]).email
    else
      'No one has been logged in'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
