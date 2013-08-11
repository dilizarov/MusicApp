class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to bands_url
    else
      flash[:error] ||= []
      flash[:error] << "Name already taken or you didn't type anything in!"
      render :new
    end
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def update
    @band = Band.find_by_id(params[:id])
    @band.update_attributes(params[:band])
    if @band.save
      redirect_to band_url
    else
      flash[:error] ||= []
      flash[:error] << "Invalid edit!"
      render :edit
    end
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy
    redirect_to bands_url
  end
end
