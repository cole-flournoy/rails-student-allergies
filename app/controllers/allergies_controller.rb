class AllergiesController < ApplicationController
  before_action :verify_logged_in

  def index
    @allergies = Allergy.all
  end

  def show
    @allergy = Allergy.find(params[:id])
  end

  def new
    @allergy = Allergy.new
  end

  def create
    # add severities to new form and associate
    params[:allergy].keys.each do |key| 
      @allergy = Allergy.new(name: params[:allergy][key]["name"], category: params[:allergy][key]["category"])
      if @allergy.save
        next
      else
        render :new
      end
    end
    redirect_to student_path(params[:student])
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
