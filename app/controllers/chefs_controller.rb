class ChefsController < ApplicationController
  before_action :require_user, only: [:edit, :destroy, :update]
  def new
    @chef= Chef.new

  end 
  
  def create
    @chef=Chef.new(params_chef)
    if @chef.save
      session[:chef_id]=@chef.id
      cookies.signed[:chef_id] = @chef.id 
      flash[:success] = "chef was created successfully!"
      redirect_to chef_path(@chef)
    else
      render :new, status: 422
    end

  end  

  def show
    @chef=Chef.find(params[:id])
  end  


  def edit
    @chef=Chef.find(params[:id])

  end

  def update
    @chef = Chef.find(params[:id])
    if @chef.update(params_chef)
      flash[:success] = "Your account was updated successfully"
      redirect_to chef_path(@chef)
    else
      render :edit, status: 422
    end  

  end  
  

  def index
    @chef=Chef.all
  end  



  def destroy
    @chef=Chef.find(params[:id]).destroy
    redirect_to chef_path(@chef)

  end  

  private
  def params_chef
    params.require(:chef).permit(:chefname, :email, :password, :password_conformaton)
  end
end