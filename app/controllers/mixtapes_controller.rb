class MixtapesController < ApplicationController
  def index
    if Mixtape.all
      @featured = Mixtape.order('RANDOM()').first
      allMixtapes = []
      Mixtape.all.each do |mixtape|
        allMixtapes.push(mixtape)
      end
      allMixtapes.delete_at(allMixtapes.index(@featured))
      @mixtapes = allMixtapes
    else
      @mixtapes = Mixtape.all
    end
  end

  def show
    @mixtape = Mixtape.find(params[:id])
    @rating = @mixtape.rating
    @review = @mixtape.reviews.new
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

  def rate
    @mixtape = Mixtape.find(params[:mixtape_id])
    @mixtape.new_rating(rate_params[:rating])
    @mixtape.save

    redirect_to mixtape_path(@mixtape)
  end

  def alphabetize
    @mixtapes = Mixtape.alphabetize
    render :index
  end

  def year_sort
    @mixtapes = Mixtape.year_sort
    render :index
  end

  def subgenres
    @mixtapes = Mixtape.find_by_subgenre(subgenre_params[:subgenre])
    render :index
  end

  def search
    @mixtapes = Mixtape.search_query(search_params[:search_input])
    render :index
  end

private
  def mixtape_params
    params.require(:mixtape).permit(:title, :image, :subgenre, :year)
  end

  def rate_params
    params.permit(:rating)
  end

  def subgenre_params
    params.permit(:subgenre)
  end

  def search_params
    params.permit(:search_input)
  end
end
