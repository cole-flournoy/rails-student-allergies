class SeveritiesController < ApplicationController
  before_action :verify_logged_in

  def destroy
    @severity = Severity.find(params[:id])
    @severity.destroy
    flash[:alert] = "Allergy Successfully Removed!"
    redirect_back fallback_location: students_path
  end

  private

  def severity_params
    params.require(:severity).permit(:name, :student_id, :allergy_id)
  end
end
