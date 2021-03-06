class ClassroomsController < ApplicationController
  before_action :verify_logged_in

  def index
    @classrooms = current_user.classrooms
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to classroom_add_students_path(@classroom)
    else
      render :new
    end
  end

  def students_to_associate
    @classroom = Classroom.find_by(id: params[:classroom_id])
    @students = Student.all
    render :associate_students
  end

  def associate_students
    student_ids = params[:student].keys.map{|k| k.to_i}
    student_ids.each do |s_id|
      Enrollment.create(student_id: s_id, classroom_id: params[:classroom_id])
    end
    redirect_to classroom_students_path(params[:classroom_id])
  end

  def remove_association
    enrollment = Enrollment.find_by(student: params[:student_id], classroom: params[:classroom_id])
    enrollment.destroy
    flash[:alert] = "Student removed from class"
    redirect_back fallback_location: classroom_students_path(params[:classroom_id]) 
  end

  def edit
    @classroom = Classroom.find(params[:id])
    verify_user
  end

  def update
    @classroom = Classroom.find(params[:id])
    verify_user
    @classroom.update(classroom_params)

    if @classroom.save
      redirect_to @classroom
    else
      render :edit
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    verify_user
    @classroom.enrollments.destroy_all
    @classroom.destroy
    flash[:alert] = "Class deleted"
    redirect_to classrooms_path
  end

  private

  def classroom_params
    params.require(:classroom).permit(:period, :subject, :teacher, :user_id)
  end
end
