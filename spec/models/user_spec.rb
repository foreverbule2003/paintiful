require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = User.create!(email: "qwe@bbb.com", password: "a1234567", password_confirmation: "a1234567")
    @post = @user.posts.create(title: "created by @user")
  end

  it 'have columns email' do
    columns = User.column_names
    expect(columns).to include("email")
  end

  it 'create user success'do 
    expect(@user.email).to eq("qwe@bbb.com")
  end

  it 'email is empty' do 
    user_empty_email = User.create(email: "", password: "a1234567", password_confirmation: "a1234567") 
    expect(user_empty_email).not_to be_valid
  end

  it { should have_many :posts}
  it { should validate_presence_of :email}

end
