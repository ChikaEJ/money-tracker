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
    if has_family? current_user
      redirect_to root_path
    else
      @family = Family.new
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
    if current_user&.family_id
      @family = Family.find(current_user.family_id)
    else if current_user.family_id.nil?
      redirect_to new_family_path
         else
      redirect_to root_path
         end
    end
  end
end
