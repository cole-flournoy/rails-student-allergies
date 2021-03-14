class StudentsController < ApplicationController
  def index
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
      @students = @classroom.students
    else
      @students = Student.all
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
      @student = Student.new(classroom_ids: @classroom.id)
    else
      @student = Student.new
    end
  end

  def create
    classroom = params[:student][:classrooms]
    @student = Student.new(student_params)
    
    if @student.save
      @student.classroom_ids = classroom
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
    params.require(:student).permit(:first_name, :last_name, :grade, :lunch_period)
  end
end
