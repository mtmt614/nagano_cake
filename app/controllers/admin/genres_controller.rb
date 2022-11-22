class Admin::GenresController < ApplicationController
  
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def edit
  end
  
  def create
  end
  
  def show
  end
end
