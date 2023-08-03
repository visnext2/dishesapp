class DishesController < ApplicationController
  before_action :require_user, except: [:index, :show, :home]
  def home

  end  

  def index
    @dish=Dish.all

  end  

  def show
    @dish=Dish.find(params[:id])
    @comments=@dish.comments
    @comment = Comment.new

  end  

  def new
    @dish=Dish.new

  end  
  
  def create
    @dish=Dish.new(params_dish)
    @dish.chef=current_chef
    if @dish.save
      flash[:success] = "dish was created successfully!"
      redirect_to new_dish_path(@dish)
    else
      render :new, status: 422
    end

  end  

  def edit
    @dish=Dish.find(params[:id])

  end  


  def update
    @dish=Dish.find(params[:id])
    if @dish.update(params_dish)
      flash[:success] = "dish was created successfully!"
      redirect_to dishes_path(@dish)
    else
      render :edit, status: 422
    end

  end  


  def destroy
    @dish=Dish.find(params[:id]).destroy
    redirect_to dishes_path(@dish)

  end  



  private
    def params_dish
      params.require(:dish).permit(:name, :description, ingredient_ids: [])
    end  
end