require 'rails_helper'

# has_many :posts, through: :post_collections, source: :post
#   has_many :post_collections

RSpec.describe Collection, type: :model do
  before(:each) do 
    @my_collection = Collection.create!
    @post1 = @my_collection.posts.create() 
    @post2 = @my_collection.posts.create()
    @pc1 = @my_collection.post_collections.create
    @pc2 = @my_collection.post_collections.create
  end

  it 'has_many posts'do
    expect(@my_collection.posts).to include(@post1,@post2)
  end

  it 'has_many post_collections' do
    expect(@my_collection.post_collections).to include(@pc1, @pc2)
  end

  it '#add_post_to_collection'do
    @post3 = Post.create(title:"for #add...")
    @my_collection.add_post_to_collection(@post3)
    expect(@my_collection.posts).to include(@post3)
  end 
end
