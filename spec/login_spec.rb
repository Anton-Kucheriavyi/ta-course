# frozen_string_literal: true

feature 'User login', js: true do
  scenario 'User can login to the system' do
    new_user = User.new

    response = create_user_api new_user
    user_id = JSON.parse(response.body)['id']

    login_user new_user.username, new_user.password
    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content new_user.firstname
    expect(@home_page.menu.user_name).to have_content new_user.lastname

    delete_user_api(user_id)
  end
end
