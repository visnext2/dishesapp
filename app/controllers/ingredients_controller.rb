class IngredientsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  def index
    @ingredient=Ingredient.all
  end  

  def show
    @ingredient = Ingredient.find(params[:id])
    

  end  

  def new
    @ingredient = Ingredient.new


  end  


  def create
    @ingredient = Ingredient.new(params_ingredient)
    if @ingredient.save
      flash[:success] = "Ingredient was successfully created"
      redirect_to ingredients_path()
    else
      render :new,status: 442
    end
  end  

  def edit
    @ingredient = Ingredient.find(params[:id])

  end  

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(params_ingredient)
      flash[:success] = "Ingredient name was updated successfully"
      redirect_to ingredients_path()
    else
      render :edit,status: 442
    end

  end  

  private
  def params_ingredient
    params.require(:ingredient).permit(:name)
  end


  
end