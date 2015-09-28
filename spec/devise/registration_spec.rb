require 'rails_helper'

describe "User registration" do
  it "creates new user with username, email and password" do
    visit new_user_registration_path

    page.fill_in "user_username", with: 'example'
    page.fill_in "user_email", with: 'example@example.com'
    page.fill_in "user_password", with: 'password'
    page.fill_in "user_password_confirmation", with: 'password'

    click_button I18n.t('devise.links.sign_up')

    expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
  end
end