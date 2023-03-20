feature 'User login', js: true do
  scenario 'User can login to the system' do
    @login_page = LoginPage.new
    @login_page.load

    @login_page.login_field.set 'uitestuser'
    @login_page.password_field.set 'testpassword123'
    @login_page.submit_button.click

    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content 'uitestuser'
  end
end