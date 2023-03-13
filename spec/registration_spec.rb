feature 'User registration', js: true do
  scenario 'User is able to register' do
    visit('https://gitlab.testautomate.me/')

    find(:dqs, 'register_link').click

    expect(page).to have_content 'First name'
  end

  scenario 'User can register to the system' do
    visit('https://gitlab.testautomate.me/')

    find(:dqs, 'register_link').click
    find('#new_user_first_name').set 'John'
    find('#new_user_last_name').set 'Doe'
    find('#new_user_username').set Faker::Name.unique.first_name
    find('#new_user_email').set Faker::Internet.email
    find('#new_user_password').set 'test123456!'
    find(:dqs, 'new_user_register_button').click

    expect(page).to have_content 'Welcome to GitLab,
John!'
  end

  scenario 'User can not register to the system with not valid password' do
    visit('https://gitlab.testautomate.me/')

    find(:dqs, 'register_link').click
    find('#new_user_first_name').set 'John'
    find('#new_user_last_name').set 'Doe'
    find('#new_user_username').set user_name
    find('#new_user_email').set Faker::Internet.email
    find('#new_user_password').set 'test'
    find(:dqs, 'new_user_register_button').click

    expect(page).to have_content 'Minimum length is 8 characters'
  end
end