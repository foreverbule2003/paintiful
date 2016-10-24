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

  it { should belong_to :category}
  it { should belong_to :user }
  it { should have_many :post_collections}
  it { should have_many :tools}
  it { should have_many :steps}
  it { should accept_nested_attributes_for :tools}
  it { should accept_nested_attributes_for :steps}
  it { should validate_presence_of :title}
  it { should validate_length_of(:title).is_at_most(140) }
  it { should validate_length_of(:description).is_at_most(140) }

  it '#do_view' do 
    expect{@post.do_view}.to change{@post.counter}.by(1)
  end

  it '#random_post' do 
    expect(@post.random_post).not_to eq(@post)
  end

  it '#other_random_post' do 
    expect(@post.other_random_post(@other_post) && @other_post).not_to eq(@post)
  end

  it 'description is too long' do 
    toolong = "a" * 200
    toolong_post = Post.create(title: "toolong", description: toolong)
    expect(toolong_post).not_to be_valid
  end
  

end