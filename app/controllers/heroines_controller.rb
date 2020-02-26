class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.search(params[:search])
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      flash[:notice] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end
end
