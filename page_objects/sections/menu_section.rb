class MenuSection < SitePrism::Section
  element :user_picture, '.js-nav-user-dropdown > a'
  element :user_name, :dqs, 'user_profile_link'
end