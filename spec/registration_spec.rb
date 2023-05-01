feature 'User registration', js: true do
  scenario 'User can register to the system' do
    user = User.new
    register_user user

    expect(page).to have_content 'Welcome to GitLab'

    @home_page = HomePage.new
    @home_page.menu.user_picture.click

    expect(@home_page.menu.user_name).to have_content user.firstname
    expect(@home_page.menu.user_name).to have_content user.lastname
  end

  scenario 'User can not register to the system with not valid password' do
    @register_page = RegistrationPage.new
    @register_page.load

    @register_page.first_name.set 'John'
    @register_page.last_name.set 'Doe'
    @register_page.user_name.set FFaker::Name.unique.first_name

    expect(page).to have_selector('.validation-success.field-validation')

    @register_page.email.set FFaker::Internet.email
    @register_page.password.set 'test'
    @register_page.registration_button.click

    expect(page).to have_content 'Minimum length is 8 characters'
  end
end