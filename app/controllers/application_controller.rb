require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "secret"
    end

    use Rack::Flash

    get '/' do
        if Helpers.current_user(session)
            flash[:message] = "There is a user logged in."
            redirect "/users/#{Helpers.current_user(session).slug}"
        else
            erb :index
        end
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            flash[:message] = "There is a user logged in."
            redirect "/users/#{Helpers.current_user(session).slug}"
        else
            erb :login
        end
    end
    
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.slug}"
        else
            flash[:message] = "Please enter correct username and password"
            redirect '/login'
        end
    end

    get '/signup' do
        if Helpers.is_logged_in?(session)
            flash[:message] = "There is a user logged in."
            redirect '/'
        else
            erb :signup
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:name] == "" || params[:password] == "" || User.find_by(username: params[:username])
            flash[:message] = "Please enter valid entries."
            redirect '/signup'
        else
            @user = User.create(username: params[:username], name: params[:name], password: params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.slug}"
        end
    end

    get '/logout' do
        session.clear
        flash[:message] = "You are logged out."
        redirect '/'
    end

end