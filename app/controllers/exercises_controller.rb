class ExercisesController < ApplicationController

    get '/exercises' do
        @exercises = Exercise.all
        erb :'/exercises/index'
    end

    get '/exercises/new' do
        if Helpers.is_logged_in?(session)
            erb :'/exercises/new'
        else
            redirect '/login'
        end
    end

    post '/exercises' do
        if Helpers.is_logged_in?(session)
            @exercise = Exercise.create(name: params[:name], calorie: params[:calorie], note: params[:note])
            redirect '/exercises'
        else
            redirect '/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    


end