class Admin::GenresController < ApplicationController


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page])
      render :index
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path(@genres)
    else
      render :edit
    end
  end

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @all_items = @genre.items
  end

private

def genre_params
    params.require(:genre).permit(:name)
end

end