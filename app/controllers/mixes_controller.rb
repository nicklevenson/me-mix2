class MixesController < ApplicationController
  include MixesHelper

  def index
    @user = current_user
    @mixes = @user.mixes
  end
  def new

  end
  def create
    params.inspect
    mix = current_user.mixes.find_or_create_by(mix_params)
    media_data = eval(media_params)
  
    content = Content.find_or_create_by(url: media_data[:url]) do |c| 
      c.update(media_data)
    end
    mix.contents << content unless mix.contents.include?(content)
  end

  def show

  end

  private

  def mix_params
    params.require(:mix).permit(:title)
  end

  def media_params
    params.require(:media)
  end
end
