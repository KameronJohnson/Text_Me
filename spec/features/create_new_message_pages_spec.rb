# require 'rails_helper'
#
# describe "create new message process", vcr: true do
#   it "will render new message" do
#     contact = FactoryGirl.create(:contact)
#     visit contacts_path
#     click_on contact.phone
#     expect(page).to have_content("New Message")
#   end
#
#   it "creates a new message for contact" do
#     contact = FactoryGirl.create(:contact)
#     visit contacts_path
#     click_on contact.phone
#     fill_in "From", with: "5032134556"
#     fill_in "Body", with: "Becky, about her butt..."
#     click_on "Create Message"
#     expect(page).to have_content("Becky, about her butt...")
#   end
# end
