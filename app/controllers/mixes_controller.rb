class MixesController < ApplicationController
  include MixesHelper
  def new

  end
  def create
    params.inspect
    mix = current_user.mixes.find_or_create_by(mix_params)
    media_data = eval(media_params)
    content = Content.find_or_create_by(url: media_data[:url])
    content.update(media_data)
    mix.contents << content unless mix.contents.include?(content)
  
  end

  private

  def mix_params
    params.require(:mix).permit(:title)
  end

  def media_params
    params.require(:media)
  end
end
