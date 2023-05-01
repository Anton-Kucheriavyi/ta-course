# frozen_string_literal: true

# This module describes repeatable action
module Helpers
  def login_user(login, password)
    @login_page = LoginPage.new
    @login_page.load

    @login_page.login_field.set login
    @login_page.password_field.set password
    @login_page.submit_button.click
  end

  def register_user(user) # rubocop:disable Metrics/AbcSize
    @register_page = RegistrationPage.new
    @register_page.load

    @register_page.first_name.set user.firstname
    @register_page.last_name.set user.lastname
    @register_page.user_name.set user.username

    expect(page).to have_selector('.validation-success.field-validation')

    @register_page.email.set user.email
    @register_page.password.set 'test123456!'
    @register_page.registration_button.click

    @register_page.role.select('Software Developer')
    @register_page.objective.select('A different reason')
  end
end
