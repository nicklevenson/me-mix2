class ContentsController < ApplicationController
  
  
  def destroy
    @mix = Mix.find(params[:mix_id])
    @mix.contents.delete(Content.find(params[:id]))
  
    redirect_to "#{params[:lasturl]}"
   
  end
end
