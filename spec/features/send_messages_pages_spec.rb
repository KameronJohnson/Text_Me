require 'rails_helper'

describe 'the send text message process', vcr: true do

  it "will send a text message", js: true do
    visit '/'
    click_on "Sign in"
    fill_in "Email", with: "Kameron@Kameron.com"
    fill_in "Password", with: "asdfasdf"
    click_on "Log in"
    click_on "New Message"
    fill_in "From", with: '5032134556'
    fill_in "To", with: '5037841300'
    fill_in "Body", with: 'Hey baby'
    click_on "Create Message"
    expect(page).to have_content "Message sent."
  end

  # it 'will send a new text message'  do
  #   visit '/'
  #   click_on 'New Message'
  #   fill_in 'From', with: "5032134556"
  #   fill_in 'To', with: "5035555555"
  #   fill_in 'Body', with: "I like your booty, baby"
  #   click_on 'Create Message'
  #     expect(page).to have_content('Message sent')
  # end
  #
  # it 'will display an error message if To number is blank' do
  #   visit new_message_path
  #   fill_in 'From', with: '5032134556'
  #   fill_in 'Body', with: 'oh my God, look at her butt!'
  #   click_on 'Create Message'
  #   expect(page).to have_content('errors')
  # end
  #
  # it 'will display an error message if From number is blank' do
  #   visit new_message_path
  #   fill_in 'To', with: '5037841300'
  #   fill_in 'Body', with: 'it is soooo big.'
  #   click_on 'Create Message'
  #   expect(page).to have_content('errors')
  # end
  #
  # it 'will display an error message if the body is blank' do
  #   visit new_message_path
  #   fill_in 'From', with: '5032134556'
  #   fill_in 'To', with: '5037841300'
  #   click_on 'Create Message'
  #   expect(page).to have_content('errors')
  # end

end
