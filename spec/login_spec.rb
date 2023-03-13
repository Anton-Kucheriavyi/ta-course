feature 'User login', js: true do
  scenario 'User can login to the system' do
    visit('https://gitlab.testautomate.me/')

    find('#user_login').set 'uitestuser'
    find('#user_password').set 'testpassword123'
    find('.js-sign-in-button').click

    expect(page).to have_content 'Welcome to GitLab'
  end
end