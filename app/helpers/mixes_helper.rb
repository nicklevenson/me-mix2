module MixesHelper
  def edit_link(mix)
    if access(mix)
      link_to "Edit", edit_user_mix_path(mix.user, mix)
    end
  end

  def access(mix)
    if current_user
      if current_user.id == mix.user.id
        true
      end
    end
  end
end
