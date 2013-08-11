class NotesController < ApplicationController

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:error] ||= []
      flash[:error] << "Invalid input!"
      render track_url(@note.track_id)
    end

  end

  def destroy

    @note = Note.find_by_id(params[:id])
    id = @note.track_id
    @note.destroy

    redirect_to track_url(id)
  end

end
