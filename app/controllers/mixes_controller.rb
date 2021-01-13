class MixesController < ApplicationController
  include MixesHelper
  def new

  end
  def create
    params.inspect
    mix = current_user.mixes.find_or_create_by(mix_params)
    media_data = eval(media_params)
    media = Media.find_or_create_by(url: media_data[:url])
    media.update(media_data)
    mix.medias << media unless mix.medias.include?(media)
  
  end

  private

  def mix_params
    params.require(:mix).permit(:title)
  end

  def media_params
    params.require(:media)
  end
end
