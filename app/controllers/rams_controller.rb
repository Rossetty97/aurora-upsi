class RamsController < ApplicationController
  before_action :set_ram, only: %i[ show edit update destroy]

  def index
    @rams = Ram.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Ram #{@ram.id}",template: "rams/show.html.erb"
      end
    end
  end

  def new
    @ram = Ram.new
  end

  def edit
  end

  def create
    @ram = Ram.new(ram_params)

    respond_to do |format|
      if @ram.save
        format.html { redirect_to root_path, notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @ram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ram.update(ram_params)
        format.html { redirect_to ram_url(@ram), notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @ram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ram.destroy

    respond_to do |format|
      format.html { redirect_to rams_url, notice: "Form was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_ram
      @ram = Ram.find(params[:id])
    end

    def ram_params
      params.require(:ram).permit(:ministry_group, :time_and_date, :location, :leaders_name,:activity, :num_of_leaders, :risks_description, :casual_factors_people, :casual_factors_equipment, :casual_factors_environment, :risk_management_emergency, :risk_management_normal_operations_people, :risk_management_normal_operations_equipment, :risk_management_normal_operations_environment, :relevant_industry_standards_applicable, :skills_required_by_staff, :form_completed_by, :approved_by, :position_in, :submision_date)
    end
end
