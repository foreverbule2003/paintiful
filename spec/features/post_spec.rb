require 'rails_helper'

feature "Create Post" do
  background do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
  end

  scenario "successful" do
    visit '/posts/new'
    fill_in 'Title', with: 'Post'
    fill_in 'Description', with: 'Hello World'
    click_button 'Create Post'
    expect(page).to have_content 'Post'
    expect(page).to have_content 'Hello World'
  end

  scenario "title blank" do 
    visit 'posts/new'
    click_button 'Create Post'
    expect(page).to have_content "can't be blank"    
  end

end