class WorkoutsController < ApplicationController

    get '/workouts' do
        @workouts = Workout.all
        erb :'/workouts/index'
    end

    get '/workouts/new' do
        if Helpers.is_logged_in?(session)
            erb :'/workouts/new'
        else
            redirect '/login'
        end
    end

    get '/workouts/:id/edit' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.find_by_id(params[:id])
            if @workout && @workout.user == Helpers.current_user(session)
                erb :'/workouts/edit'
            else
                redirect '/workouts'
            end
        else
            redirect '/login'
        end
    end

    get '/workouts/:id' do
        @workout = Workout.find_by_id(params[:id])
        erb :"/workouts/show"
    end

    post '/workouts' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.create(params[:workout])
            if !params[:exercise][:name] == "" && !params[:exercise][:calorie] == "" && !params[:exercise][:note] == ""
                @workout.exercises << Exercise.create(params[:exercise])
                redirect "/users/#{Helpers.current_user(session).id}"
            else
                redirect '/workouts/new'
            end
        else
            redirect '/login'
        end
    end

    patch '/workouts/:id' do
        @workout = Workout.find_by_id(params[:id])
        @workout.update(params[:workout])
        redirect "/workouts/#{@workout.id}"
    end

    delete 'workouts/:id' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.find_by_id(params[:id])
            if @workout && @workout.user == Helpers.current_user(session)
                @workout.delete
            else
                redirect '/workouts'
            end
        else
            redirect '/login'
        end
        
    end

    




end