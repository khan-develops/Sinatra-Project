require './config/environment'

class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    get '/' do
        if Helpers.current_user(session)
            redirect "/users/#{Helpers.current_user(session).id}"
        else
            erb :index
        end
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            redirect "/users/#{Helpers.current_user(session).id}"
        else
            erb :login
        end
    end
    
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect '/'
        else
            erb :signup
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:name] == "" || params[:password] == "" || User.find_by(username: params[:username])
            redirect '/signup'
        else
            @user = User.create(username: params[:username], name: params[:name], password: params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end




end