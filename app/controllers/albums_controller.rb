class AlbumsController < ApplicationController
  def index
    # @albums = Album.find_all_by_band_id(params[:band_id])
#     @band = Band.find_by_id(params[:band_id])
    @albums = Album.all
    render :index
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to albums_url
    else
      flash[:error] ||= []
      flash[:error] << "Invalid attributes!"
      render :new
    end
  end

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def edit
    @album = Album.find_by_id(params[:id])
    @bands = Band.all
    render :edit
  end

  def show
    # @albums = Album.find_all_by_band_id(params[:band_id])
    # @album = @albums[params[:id].to_i - 1]
    #
    @album = Album.find_by_id(params[:id])

    if @album
      render :show
    else
      flash[:error] ||= []
      flash[:error] << "This album doesn't exist"
      redirect_to band_albums_url
    end
  end

  def update
    @album = Album.find_by_id(params[:id])
    @album.update_attributes(params[:album])
    if @album.save
      redirect_to album_url
    else
      flash[:error] ||= []
      flash[:error] << "Invalid edit!"
      render :edit
    end

  end

  def destroy
    @album = Album.find_by_id(params[:id])
    @album.destroy
    redirect_to albums_url
  end
end
