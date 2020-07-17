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


    get '/signup' do
        if Helpers.is_logged_in?(session)
            redirect '/'
        else
            erb :signup
        end
    end

    post '/signup' do
        raise params.inspect
    end




end