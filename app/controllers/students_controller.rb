class StudentsController < ApplicationController
  before_action :verify_logged_in
  PERMITTED_PARAMS = [:first_name, :last_name, :grade, :lunch_period]

  def index
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
      verify_user
      @students = @classroom.students
    else
      @students = Student.all.sort_by{ |s| s.last_name}
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def with_allergy
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
      verify_user
      @students = @classroom.students.has_allergy.sort_by{ |s| s.last_name}
    else
      @students = Student.has_allergy.sort_by{ |s| s.last_name}
    end
  end

  def new
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
      verify_user
      @student = Student.new
    elsif params[:student_count]
      @student_count = params[:student_count].to_i
    else
      @student = Student.new
    end
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      if params[:student][:classrooms]
        Enrollment.create(student_id: @student.id, classroom_id: params[:student][:classrooms])
      end
      if params[:student][:allergy_count] == "0"
        redirect_to @student
      else 
        @allergy_count = params[:student][:allergy_count].to_i
        @allergy = Allergy.new
        render '/allergies/new'
      end
    else
      render :new
    end
  end

  def batch_create
    params[:student].keys.each do |key|
      args = params[:student][key] 
      if args.keys.map{|k| k.to_sym} == PERMITTED_PARAMS
        args.permit!
        student = Student.new(args)
        if student.save
          next
        else
          flash[:alert] = "Could not create student batch. Please fill in all fields before submitting"
          redirect_to(students_path) and return
        end
      end
    end   
    redirect_to students_path 
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
    @student.severities.destroy_all
    @student.destroy
    flash[:alert] = "Student deleted"
    redirect_back fallback_location: students_path
  end

  private

  def student_params
    params.require(:student).permit(*PERMITTED_PARAMS)
  end
end
