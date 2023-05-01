# frozen_string_literal: true

feature 'User login', js: true do
  scenario 'User can login to the system' do
    login_user ENV['USERNAME'], ENV['PASSWORD']
    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content 'uitestuser'
  end
end
