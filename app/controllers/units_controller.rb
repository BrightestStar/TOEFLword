class UnitsController < ApplicationController

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(unit_params)
    @unit.save
    
    redirect_to '/'
  end

  private

  def unit_params
    params.require(:unit).permit(:unit_number)
  end
end
