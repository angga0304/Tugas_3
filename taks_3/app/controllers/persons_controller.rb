class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
  end
  def create
    @person = Person.new(params_person)
    if @person.save
      flash[:notice] = "Data saved"
      redirect_to action: 'index'
    else
      flash[:error] ="data not valid"
      render 'new'
    end
  end

  def edit
    @person = Person.find_by_id(params[:id])
  end
  def update
    @person = Person.find_by_id(params[:id])
    if @person.update(params_person)
       flash[:notice] = "Data updated"
      redirect_to action: 'index'
    else
      flash[:error] ="data not valid"
      render 'edit'
    end
  end

  def destroy
    @person = Person.find_by_id(params[:id])
    if @person.destroy
      flash[:notice] = "Data deleted"
      redirect_to action: 'index'
    else
      flash[:error] ="fails to delete data"
      redirect_to action: 'index'
    end
  end

private
  def params_person
    params.require(:person).permit(:name,:noktp,:birthdate,:houseid)
  end
end
