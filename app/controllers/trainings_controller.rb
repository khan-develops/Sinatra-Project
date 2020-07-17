class TrainingsController < ApplicationController

    get '/trainings' do
        @trainings = Training.all
        erb :'/trainings/index'
    end

    get '/trainings/:id' do
        @training = User.find_by(id: params[:id])
        erb :'/trainings/show'
    end

    get '/trainings/new' do
        @training = Training.new
        if is_logged_is?(session)
            erb :'/trainings/new'
        else
            redirect '/login'
        end
    end

    post '/trainings' do
        if is_logged_is?(session)
            @training = Training.create(params[:user_id], params[:day_id], params[:exercise_id])
        else
            redirect '/'
        end
    end




end