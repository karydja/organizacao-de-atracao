require "rails_helper"

RSpec.feature "Attraction creation", :type => :feature do
  scenario "with valid attributes" do
    login_user
    visit root_path

    fill_in "attraction_name", with: "Attraction example"
    fill_in "attraction_description", with: "Description example"
    click_button I18n.t('actions.save')

    expect(page).to have_text(I18n.t('attraction.alerts.created'))
  end

  scenario "with invalid attributes" do
    login_user
    visit root_path

    fill_in "attraction_name", with: ""
    fill_in "attraction_description", with: "Description example"
    click_button I18n.t('actions.save')

    expect(page).to have_text(I18n.t('attraction.alerts.not_created'))
  end
end