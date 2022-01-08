class TapsController < ApplicationController
	def create
		@service = Service.find(params[:service_id])
		@tap = @service.taps.create(params[:tap].permit(:in_time, :out_time, :usage))

		redirect_to service_path(@service)
	end
end
