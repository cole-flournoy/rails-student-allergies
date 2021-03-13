class ClassroomsController < ApplicationController
  def index
    # reference from current_user
    @classrooms = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to classroom_path(@classroom)
    else
      flash[:alert] = "Could not be created"
      render :new
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end

  def update
    @classroom = Classroom.find(params[:id])

    @classroom.update(classroom_params)

    if @classroom.save
      redirect_to @classroom
    else
      render :edit
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    # flash[:notice] = "Classroom deleted."
    redirect_to classrooms_path
  end

  private

  def classroom_params
    params.require(:classroom).permit(:period, :subject, :teacher, :user_id, student_ids: [])
  end
end
