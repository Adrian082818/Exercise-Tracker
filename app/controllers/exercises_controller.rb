class ExercisesController < ApplicationController 
before_action :authenticate_user!

def index 
    if params[:coach_id]
        @exercises = current_user.exercises.by_coach(params[:coach_id])
    else 
        @exercises = current_user.exercises
    end 
end 

def show 
    @exercise = current_user.exercises.find_by(id: params[:id])
end 

def new 
    @exercise = current_user.exercises.build
    @exercise.build_coach
    @coach = Coach.find_by(id: params[:coach_id]) 
end 

def create
    @exercise = current_user.exercises.build(exercise_params)
    if @exercise.save 
        redirect_to exercises_path 
    else 
        flash.now[:error] = @exercise.errors.full_messages
        render :new 
    end 
end 

def edit 
    @exercise = Exercise.find_by(id: params[:id])
end 

def update 
    @exercise = Exercise.find_by(id: params[:id])

    if @exercise.update(exercise_params)
        redirect_to @exercise
    else 
        flash.now[:error] = @exercise.errors.full_messages
        render 'edit'
    end 
end 

def destroy 
    @exercise = Exercise.find_by(id: params[:id])
    if @exercise.delete 
        redirect_to exercises_path
    end 
end 

private

def exercise_params
    params.require(:exercise).permit(:name, :sets, :reps, :weight, coach_attributes: [:name])
end 

end 