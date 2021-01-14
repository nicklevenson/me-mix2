class MixesController < ApplicationController
  include MixesHelper

  def index
    @user = User.find(params[:user_id])
    @mixes = @user.mixes
  end
  def new
    @mix = Mix.new
  end
  def create
    byebug
    params.inspect
    @mix = current_user.mixes.find_or_create_by(mix_params)
    if @mix.valid?
      if params[:content_id]
        content = Content.find(params[:content_id])
        @mix.contents << content unless @mix.contents.include?(content)
        redirect_to "#{params[:lasturl]}"
      elsif params[:media]
        media_data = eval(media_params)
        content = Content.find_or_create_by(url: media_data[:url]) do |c| 
          c.update(media_data)
        end
        @mix.contents << content unless @mix.contents.include?(content)
      else
        redirect_to user_mix_path(current_user, @mix)
      end
    else
      render :new
    end
    
  end

  def show
    @mix = Mix.find(params[:id])
  end

  def edit
    @mix = Mix.find(params[:id])
    return head(:forbidden) unless (access)
  end

  def update

    @mix = Mix.find(params[:id])
    # @mix.contents = []
    @mix.update(mix_update_params)
    redirect_to user_mix_path(current_user, @mix)
  end

  private

  def mix_params
    params.require(:mix).permit(:title)
  end

  def media_params
    params.require(:media)
  end

  def mix_update_params
    params.require(:mix).permit(:title, :description)
  end
end
