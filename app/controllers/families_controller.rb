class FamiliesController < ApplicationController
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
      redirect_to family_path(@family)
    else
      flash.now[:error] = "Failed to create family."
      render :index
    end
  end

  def new
    @family = Family.new
  end

  def update
    @family.update(params[:family])
    @family.save
    redirect_to family_path(@family)
  end

  def show
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
    @family = Family.find(params[:id])
  end
end
