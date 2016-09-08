require 'rails_helper'

RSpec.describe Post, type: :model do 
  before(:each) do 
    @post = Post.create(title: "post", like: 0, counter: 0)
    @other_post = @post.random_post
  end
  it 'have columns(id title description category_id counter like)'do 
    columns = Post.column_names
    expect(columns).to include("id")
    expect(columns).to include("title")
    expect(columns).to include("description")
    expect(columns).to include("category_id")
    expect(columns).to include("counter")
    expect(columns).to include("like")
  end 

  it 'title is empty' do 
    empty_title = Post.create(title: "")
    expect(empty_title).not_to be_valid
  end

  it 'belongs_to category'do
    category = Category.create(name: "test_category")
    post = category.posts.build(title: "post")
    expect(category.posts).to include(post)
  end

  it 'belongs_to user' do 
    user = User.create(id: 1)
    post = user.posts.build(title: "user build it")
    expect(user.posts).to include(post)
  end

  it '#do_like' do 
    expect{@post.do_like}.to change{@post.like}.by(1)
  end

  it '#do_view' do 
    expect{@post.do_view}.to change{@post.counter}.by(1)
  end

  it '#random_post' do 
    expect(@post.random_post).not_to eq(@post)
  end

  it '#other_random_post' do 
    expect(@post.other_random_post(@other_post) && @other_post).not_to eq(@post)
  end


  

end