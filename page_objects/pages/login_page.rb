# frozen_string_literal: true

class LoginPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_in'

  element :login_field, '#user_login'
  element :password_field, '#user_password'
  element :submit_button, '.js-sign-in-button'
end
