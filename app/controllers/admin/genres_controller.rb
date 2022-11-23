class Admin::GenresController < ApplicationController


  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
  end

  def show
  end
end
