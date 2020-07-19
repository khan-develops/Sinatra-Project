require 'rack-flash'

class WorkoutsController < ApplicationController
    use Rack::Flash

    get '/workouts' do
        @workouts = Workout.all
        erb :'/workouts/index'
    end

    get '/workouts/new' do
        if Helpers.is_logged_in?(session)
            erb :'/workouts/new'
        else
            flash[:message] = "Please log in before create new workout session."
            redirect '/login'
        end
    end

    get '/workouts/:slug/edit' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.find_by_slug(params[:slug])
            if @workout && @workout.user == Helpers.current_user(session)
                erb :'/workouts/edit'
            else
                flash[:message] = "Only current users can edit their own workout sessions."
                redirect '/workouts'
            end
        else
            flash[:message] = "Please log in in orderto edit your workout session."
            redirect '/login'
        end
    end

    get '/workouts/:slug' do
        @workout = Workout.find_by_slug(params[:slug])
        erb :'/workouts/show'
    end

    post '/workouts' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.create(params[:workout])
            if !params[:exercise][:name] == "" || !params[:exercise][:calorie] == "" || !params[:exercise][:note] == ""
                @workout.exercises << Exercise.create(params[:exercise])
            end
        else
            flash[:message] = "Please log in in order to edit your workout session."
            redirect '/login'
        end
        redirect "/users/#{Helpers.current_user(session).slug}"
    end

    patch '/workouts/:id' do
        @workout = Workout.find_by_id(params[:id])
        @workout.update(params[:workout])
        redirect "/workouts/#{@workout.slug}"
    end

    delete '/workouts/:slug/delete' do
        if Helpers.is_logged_in?(session)
            @workout = Workout.find_by_slug(params[:slug])
            if @workout && @workout.user == Helpers.current_user(session)
                @workout.delete
            else
                flash[:message] = "You need to be current user in order to delete any workout session."
                redirect '/workouts'
            end
        else
            flash[:message] = "Please log in in order to delete your workout session."
            redirect '/login'
        end
        redirect "/users/#{Helpers.current_user(session).slug}"
        
    end

    




end