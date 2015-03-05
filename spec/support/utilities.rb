include ApplicationHelper

def valid_signin(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_user_page_contents_owned_by do |user|
  match do |page|
    expect(page).to have_title(user.name)
    expect(page).to have_content(user.name)
  end
end

RSpec::Matchers.define :have_private_contents_owned_by do |user|
  match do |page|
    expect(page).to have_link('Profile', href: user_path(user))
    expect(page).to have_link('Settings', href: edit_user_path(user))
    expect(page).to have_link('Sign out', href: signout_path)
  end
end

def sign_in(user, options={})
  if options[:no_capybara]
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
