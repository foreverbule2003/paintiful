require 'rails_helper'

RSpec.describe PostCollection, type: :model do

  it 'belongs_to Collection' do
    @col = Collection.create
    @pc = @col.post_collections.create
    expect(@col.post_collections).to include(@pc)
  end

  it 'belongs_to Post' do
    @p = Post.create
    @pc1 = @p.post_collections.new
    expect(@p.post_collections).to include(@pc1)
  end
end
