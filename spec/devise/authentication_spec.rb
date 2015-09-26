require 'rails_helper'

describe "User authentication" do
  context "when authentication pass" do
    let(:user) { create(:user) }

    it "should authenticate user with username" do
      visit new_user_session_path

      page.fill_in "user_login", with: user.username
      page.fill_in "user_password", with: user.password

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
    end

    it "should authenticate user with email" do
      visit new_user_session_path

      page.fill_in "user_login", with: user.email
      page.fill_in "user_password", with: user.password

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
    end
  end

  context "when authentication fails" do
    let(:user) { create(:user) }

    it "should not authenticate user with username" do
      visit new_user_session_path

      page.fill_in "user_login", with: user.username
      page.fill_in "user_password", with: "#{user.password}_foo"

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(page).to have_content(I18n.t('devise.failure.invalid'))
    end

    it "should not authenticate user with email" do
      visit new_user_session_path

      page.fill_in "user_login", with: user.email
      page.fill_in "user_password", with: "#{user.password}_foo"

      click_button I18n.t('devise.sessions.new.sign_in')

      expect(page).to have_content(I18n.t('devise.failure.invalid'))
    end
  end
end