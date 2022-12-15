class OfficesController < ApplicationController
  def new
    @office = Office.new
  end

  def create
    @office = Office.create(office_params)
    redirect_to offices_path
  end

  def index
    @offices = Office.all
  end

  def destroy
  end

  private

  def office_params
    params.require(:office).permit(:name)
  end
end
