class MixtapesController < ApplicationController
  def index
    @mixtapes = Mixtape.all
  end

  def show
    @mixtape = Mixtape.find(params[:id])
    @rating = @mixtape.rating
  end

  def new
    @user = User.find(params[:user_id])
    @mixtape = @user.mixtapes.new
  end

  def create
    @user = User.find(params[:user_id])
    @mixtape = @user.mixtapes.new(mixtape_params)
    if @mixtape.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @mixtape = Mixtape.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @mixtape = Mixtape.find(params[:id])
    if @mixtape.update (mixtape_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @mixtape = Mixtape.find(params[:id])
    @mixtape.destroy
    redirect_to user_path(@user)
  end

private
  def mixtape_params
    params.require(:mixtape).permit(:title, :image, :subgenre, :year)
  end
end
