module MixesHelper
  def edit_link(mix)
    if access
      link_to "Edit", edit_user_mix_path(mix.user, mix)
    end
  end

  def new_link
    if access
      link_to "New Mix", new_user_mix_path(current_user)
    end
  end

  def access
    if current_user
      if current_user.id == params[:user_id].to_i
        true
      end
    end
  end
end
