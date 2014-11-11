class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end
  def create
    @house = House.new(params_house)
    if @house.save
      flash[:notice] ="Data Saved"
      redirect_to action: 'index'
    else
      flash[:error]= "data not valid"
      render 'new'
    end
  end

  def edit
    @house = House.find_by_id(params[:id])
  end
  def update
    @house = House.find_by_id(params[:id])
    if @house.update(params_house)
      flash[:notice] = "Data updated"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'edit'
    end
  end

  def destroy
    @house = House.find_by_id(params[:id])
    if @house.destroy
      flash[:notice] = "Data Deleted"
      redirect_to action: 'index'
    else
      flash[:error] = "fails to delete data"
      redirect_to action: 'index'
    end
  end

private
  def params_house
    params.require(:house).permit(:houseno,:tipe,:address)
  end
end
