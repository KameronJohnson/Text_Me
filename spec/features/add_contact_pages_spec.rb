require 'rails_helper'

describe "add a contact process", vcr: true do
  it 'adds a new contact' do
    visit messages_path
    click_on "Contacts"
    click_on "Add Contact"
    fill_in "Name", with: "Morgan Freeman"
    fill_in "Phone", with: "5035555555"
    click_on "Create Contact"
    expect(page).to have_content "Contact added"
  end

  it "returns error if name field is blank" do
    visit messages_path
    click_on "Contacts"
    click_on "Add Contact"
    fill_in "Phone", with: "5035555555"
    click_on "Create Contact"
    expect(page).to have_content "Please fix these errors"
  end

  it "returns error if name field is blank" do
    visit messages_path
    click_on "Contacts"
    click_on "Add Contact"
    fill_in "Name", with: "Morgan Freeman"
    click_on "Create Contact"
    expect(page).to have_content "Please fix these errors"
  end
end
