class TrainingsController < ApplicationController

    get '/trainings/new' do
        @days = Day.all
        @exercises = Exercise.all
        if Helpers.is_logged_in?(session)
            erb :'/trainings/new'
        else
            redirect '/login'
        end
    end

    post '/trainings' do
        if Helpers.is_logged_in?(session)
            @training = Training.create(params[:training])
        else
            redirect '/'
        end
    end

    get '/trainings' do
        @trainings = Training.all
        erb :'/trainings/index'
    end

    get '/trainings/:id' do
        
        @training = User.find_by(id: params[:id])
        erb :'/trainings/show'
    end

    






end