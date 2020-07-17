class ExercisesController < ApplicationController

    get '/exercises' do
        @exercises = Exercise.all
        erb :'/exercises/index'
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end


end