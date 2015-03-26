require 'rails_helper'

feature 'user admin' do
  let(:user) { create(:user) }
  before(:each) do
    capy_login
  end

  it "shows the user index page" do
    click_link "Users"
    expect(page).to have_text("Download:")
  end

  it "allows creation of new user" do
    click_link "Users"
    click_link "New User"
    fill_in "First name", with: Faker::Name.first_name
    fill_in "Last name", with: Faker::Name.last_name
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Profile order", with: 1
    click_button "Create User"
    expect(page).to have_text("User was successfully created.")
  end

  context "editing user" do
    let(:new_first_name) { Faker::Name.first_name }
    before(:each) do
      click_link "Users"
      within ".index_table" do
        first(:link, "Edit").click
      end
    end

    it "allows editing of an existing user" do
      fill_in "First name", with: new_first_name
      click_button "Update User"
      expect(page).to have_text(new_first_name)
    end

    it "doesn't save if the email is blank" do
      fill_in "Email", with: ""
      click_button "Update User"
      expect(page).to have_text "can't be blank"
    end


  end

end
