class NotesController < ApplicationController
  def destroy
    @mix = Mix.find(params[:mix_id])
    @mix.notes.destroy(Note.find(params[:id]))
    redirect_to "#{params[:lasturl]}"
  end
end
