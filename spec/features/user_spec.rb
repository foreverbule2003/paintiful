require 'rails_helper'

feature "Signing in" do
  background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/users/sign_in'
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'caplin'
    click_button 'Log in'
    # visit '/posts'
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:other_user) { User.create(:email => 'other@example.com', :password => 'rous') }

  xscenario "Signing in as another user" do
    visit '/users/sign_in'
    
    fill_in 'Email', :with => other_user.email
    fill_in 'Password', :with => other_user.password
    click_button 'Log in'
    expect(page).to have_content ''
  end

  xscenario "user signup successfully" do
    visit '/users/sign_up'
    
    fill_in 'Email', :with => other_user.email
    fill_in 'Password', :with => other_user.password
    fill_in 'Password confirmation', with: other_user.password
    click_button 'Sign in'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end