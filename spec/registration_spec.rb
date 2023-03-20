feature 'User registration', js: true do
  scenario 'User can register to the system' do
    @register_page = RegistrationPage.new
    @register_page.load

    @register_page.first_name.set 'John'
    @register_page.last_name.set 'Doe'
    @register_page.user_name.set Faker::Name.unique.first_name

    expect(page).to have_selector('.validation-success.field-validation')

    @register_page.email.set Faker::Internet.email
    @register_page.password.set 'test123456!'
    @register_page.registration_button.click

    @register_page.roles.first.select('Software Developer')
    @register_page.objectives.first.select("A different reason")

    @register_page.wait_until_other_objective_visible(wait: 1)

    @register_page.other_objective.set 'Whatever reason'
    @register_page.finish_registration_button.click

    expect(page).to have_content 'Welcome to GitLab'
  end

  scenario 'User can not register to the system with not valid password' do
    @register_page = RegistrationPage.new
    @register_page.load

    @register_page.first_name.set 'John'
    @register_page.last_name.set 'Doe'
    @register_page.user_name.set Faker::Name.unique.first_name

    expect(page).to have_selector('.validation-success.field-validation')

    @register_page.email.set Faker::Internet.email
    @register_page.password.set 'test'
    @register_page.registration_button.click

    expect(page).to have_content 'Minimum length is 8 characters'
  end
end