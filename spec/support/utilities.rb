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

RSpec::Matchers.define :redirect_to_page_owned_by do |user|
  match do |page|
    expect(page).to have_title(user.name)
    expect(page).to have_content(user.name)
    expect(page).to have_link('Profile', href: user_path(user))
    expect(page).to have_link('Sign out', href: signout_path)
  end
end
