class Collection < ActiveRecord::Base
  has_many :posts, through: :post_collections, source: :post
  has_many :post_collections

  def add_post_to_collection(post)
    pc = post_collections.create
    pc.post = post
    pc.save
  end
end
