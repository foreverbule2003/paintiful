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

  it 'have many posts' do 
    expect(@post.title).to eq("created by @user")
  end
  it 'destroy associated post' do

    # post = user.posts.create(title: "user build it")
    expect { @user.destroy! }.to change { Post.count }.by(-1)
  end

end