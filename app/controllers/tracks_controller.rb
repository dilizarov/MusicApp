class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render :index
  end

  def create
    @track = Track.new(params[:track])
    if @track.save
      redirect_to tracks_url
    else
      flash[:error] ||= []
      flash[:error] << "Invalid attributes!"
      render :new
    end
  end

  def new
    @albums = Album.all
    @track = Track.new
    render :new
  end

  def edit
    @albums = Album.all
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def update
    @track = Track.find_by_id(params[:id])
    @track.update_attributes(params[:track])
    if @track.save
      redirect_to tracks_url
    else
      flash[:error] ||= []
      flash[:error] << "Invalid attributes!"
      render :new
    end
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    @track.destroy
    redirect_to tracks_url
  end
end
