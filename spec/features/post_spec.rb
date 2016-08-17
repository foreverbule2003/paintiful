require 'rails_helper'

feature "Create Post" do
  background do
    # Post.create(title: "Post", description: "Hello world")
    
    # byebug

    current_user=User.create(id: 123)
    
  end

  scenario "correct credentials" do
    visit '/posts/new'
    fill_in 'Title', with: 'Post'
    fill_in 'Description', with: 'Hello World'
    click_button 'Create Post'
    expect(page).to have_content 'Post'
    expect(page).to have_content 'Hello World'
  end


end