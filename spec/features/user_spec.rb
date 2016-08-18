require 'rails_helper'

feature "Signing in" do
  background do
    user = FactoryGirl.create(:user)
    # login_as(user, scope: :user)
  end

  scenario "successful" do
    # logout(:user)
    visit '/users/sign_in'
    fill_in 'Email', :with => 'aaa@bbb.com'
    fill_in 'Password', :with => 'a1234567'
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:other_user) { User.create(:email => 'other@example.com', :password => 'rous') }

  scenario "another user" do
    visit '/users/sign_in'
    
    fill_in 'Email', :with => other_user.email
    fill_in 'Password', :with => other_user.password
    click_button 'Sign in'
    expect(page).to have_content ''
  end

 
end

feature "Sign up" do
   scenario "successful" do
    visit '/users/sign_up'
    fill_in 'Email', :with => 'bbb@bbb.com'
    fill_in('Password', with: 'a1234567')
    fill_in('Password confirmation', with: 'a1234567')
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end