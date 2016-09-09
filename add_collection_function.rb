  collection 
    has_many posts, through: :PostCollection, source: :post
    has_many PostCollection 

  PostCollection
    post_id
    collection_id
    belongs_to post
    belongs_to collection

  post 
    has_many post_collections

  cart 
    has_many items, through: cart_items, source: :product
    has_many cart_items 

  cart_item
    belongs_to :cart
    belongs_to :product

  product
    has_many