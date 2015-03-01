require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Sign in') }
      it { should have_error_message('invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_error_message('invalid') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }

      it { should have_user_page_contents_owned_by(user) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end
