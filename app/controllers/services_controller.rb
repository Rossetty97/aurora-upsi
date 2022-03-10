class ServicesController < ApplicationController
  load_and_authorize_resource
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = current_user.services.build
  end

  def edit
  end

  def create
    @service = current_user.services.build(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to service_url(@service), notice: "Service was successfully created." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to service_url(@service), notice: "Service was successfully updated." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: "Service was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name, :description, :capacity, :current_usage, :usage_reminder, :price, :user_id)
    end
end
