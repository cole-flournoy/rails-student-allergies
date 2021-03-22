class AllergiesController < ApplicationController
  before_action :verify_logged_in

  def index
    @allergies = Allergy.all
  end

  def show
    @allergy = Allergy.find(params[:id])
  end

  def new
    if params[:student_id]
      @student = Student.find_by(id: params[:student_id])
      if @student
        @allergy = Allergy.new
        @allergy_count = 1
      else
        flash[:alert] = "No matching student found"
        redirect_back(fallback_location: students_path) 
      end
    else
      redirect_back(fallback_location: students_path)
    end
  end

  def create
    params[:allergy].keys.each do |key| 
      existing_allergy = Allergy.find_by(name: params[:allergy][key]["name"])
      @student = Student.find(params[:student])
      if existing_allergy
        Severity.create(level: params[:allergy][key]["severity"], allergy_id: existing_allergy.id, student_id: @student.id)
      else
        @allergy = Allergy.new(name: params[:allergy][key]["name"], category: params[:allergy][key]["category"])
        if @allergy.save
          Severity.create(level: params[:allergy][key]["severity"], allergy_id: @allergy.id, student_id: @student.id) 
        else
          render :new
        end
      end
    end
    redirect_to student_path(@student)
  end

  def edit
    @allergy = Allergy.find(params[:id])
  end

  def update
    @allergy = Allergy.find(params[:id])

    @allergy.update(allergy_params)

    if @allergy.save
      redirect_to @allergy
    else
      render :edit
    end
  end

  def destroy
    @allergy = Allergy.find(params[:id])
    @allergy.destroy
    # flash[:notice] = "Allergy deleted."
    redirect_to allergies_path
  end

  private

  def allergy_params
    params.require(:allergy).permit(:name, :category)
  end
end
