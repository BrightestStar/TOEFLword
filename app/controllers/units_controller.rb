class UnitsController < ApplicationController

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save

    redirect_to '/'
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update!(unit_params)

    redirect_to '/'
  end

  private

  def unit_params
    params.require(:unit).permit(:unit_number, :input_status)
  end
end
