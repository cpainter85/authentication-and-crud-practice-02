class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: 'Movied added!'
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'Movie updated!'
    else
      render :edit
    end
  end

  def destroy
    Movie.destroy(params[:id])
    redirect_to movies_path, notice: 'Movie removed!'
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :length)
  end

end
