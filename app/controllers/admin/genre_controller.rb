class Admin::GenreController < ApplicationController
  
  def index
    @genre = Genre.new
    @genre = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
end
