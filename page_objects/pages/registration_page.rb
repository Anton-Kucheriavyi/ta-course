# frozen_string_literal: true

class RegistrationPage < SitePrism::Page
  set_url 'https://gitlab.testautomate.me/users/sign_up'

  element :first_name, '#new_user_first_name'
  element :last_name, '#new_user_last_name'
  element :user_name, '#new_user_username'
  element :email, '#new_user_email'
  element :password, '#new_user_password'
  element :registration_button, :dqs, 'new_user_register_button'
  element :role, :dqs, 'role_dropdown'
  element :objective, '#user_registration_objective'
  element :other_objective, '#jobs_to_be_done_other'
  element :finish_registration_button, :dqs, 'get_started_button'
end
