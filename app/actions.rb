# Homepage (Root path)
enable :sessions

helpers do
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:usere_id])
    end
  end
end

get '/success' do
  erb :'success'
end

get '/successful-login' do
  erb :'successful-login'
end

get '/err-login' do
  erb :'err-login'
end

get '/user/new' do
  erb :'user/new'
end

post '/user/new' do
  @user = User.new(
    email: params[:email],
    username: params[:username],
    password: params[:password]
  )
  @user.save
  redirect '/success'
end


get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    #content: params[:content],
    author: params[:author]
  )
  if @song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end


get '/login' do
  erb :'login'
end

post '/login' do
  @user = User.where(username: params[:username], password: params[:password]).first

  if @user
    session[:id] = @user.id
    redirect '/successful-login'
  else
    redirect '/err-login'
  end
end

=begin

fet '/login' do
  session[:username] = params[:username]
  @user = User.find_by
 
 require 'sinatra'

 configure do
  enable :sessions
  end

  before do
    content_type :text
  end

  get '/set' do
    session[:foo] = Time.now
    "session value set"
    end
  get '/fetch' do

 get '/' do
  response 

=end
