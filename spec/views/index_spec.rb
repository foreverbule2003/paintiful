require 'rails_helper'

RSpec.describe "posts/index.html.haml", type: :view do 
  it 'can render'do 
    @post = Post.create(counter: 1, like: 1)
    @posts = Array.new(2, @post)
    render
    expect(rendered).to include(@post.counter.to_s)
    expect(rendered).to include(@post.like.to_s)
  end 

end