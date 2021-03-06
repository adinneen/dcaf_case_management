class CallsController < ApplicationController
  def create
    c = Case.find(params[:id])
    @call = c.calls.new(call_params)
		if @call.save
			redirect_to root_path
    else
      flash[:alert] = "Call failed to save! Please submit the call again."
      redirect_to root_path
		end
  end

  private

	def call_params
		params.require(:call).permit(:status)
	end
end
