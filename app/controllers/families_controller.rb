class FamiliesController < ApplicationController
  include FamiliesHelper
  before_action :set_family, only: [ :show, :update, :destroy ]
  def index
    @families = Family.all
    if @families.empty?
      @family = Family.new
    else
      @families
    end
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.family_id = @family.id
      current_user.save
      redirect_to family_path(@family)
    else
      flash.now[:error] = "Failed to create family."
      render :index
    end
  end

  def new
    if !current_user.family_id.nil?
      redirect_to root_path
    else
      @family = Family.new
      @families = Family.all
    end
  end

  def update_family_for_user
    current_user.family_id = params[:family_id]
    if current_user.save
      redirect_to family_path(current_user.family_id)
    else
      flash.now[:error] = "Failed to update family."
      render :new
    end
  end

  def update
    @family.update(params[:family])
    @family.save
    redirect_to family_path(@family)
  end

  def show
    @users = @family.users
  end

  def destroy
    @family.delete
    redirect_to families_path
  end

  private
  def family_params
    params.require(:family).permit(:family_name)
  end

  def set_family
    if current_user.family_id
      @family = Family.find(current_user.family_id)
    else
      redirect_to new_family_path
    end
  end
end
