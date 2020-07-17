require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        erb :index
    end

    get '/login' do
        @user = User.find(params[:id])
        redirect 'exercies/index'
    end



    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect '/'
        else
            erb :signup
        end
    end

    post '/signup' do
        @user = User.create(username: params[:username], name: params[:name], password: params[:password])
        session[:user_id] = @user.id
        redirect '/exercises'
    end




end