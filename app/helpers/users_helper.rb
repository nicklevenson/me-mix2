module UsersHelper
  def profile_image(user)

    if user.avatar.attached?
      "<div class='profile-image rounded'><img src='#{(url_for(user.avatar))}' class='rounded' width='155'></div>".html_safe
    else
      "<div class='profile-image rounded'><img src='#{user.image}' class='rounded' width='155'></div>".html_safe
    end
  
  end
end
