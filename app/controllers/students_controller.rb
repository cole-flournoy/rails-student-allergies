class StudentsController < ApplicationController
  def index
    if params[:classroom_id]
      @students = Classroom.find(params[:classroom_id]).students
    else
      @students = Student.all
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    # if classroom_id, build Student from classroom
    if params[:classroom_id]
      @student = Classroom.find(params[:classroom_id]).students.build
    else
      @student = Student.new
    end
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    @student.update(student_params)

    if @student.save
      redirect_to @student
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    # flash[:notice] = "Student deleted."
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :classroom_id)
  end
end
