class Admin::GenresController < ApplicationController
  
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    # byebug
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end
   private

  def genre_params
    params.require(:genre).permit(:genre)
  end
end
