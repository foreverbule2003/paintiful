require 'rails_helper'

RSpec.describe "posts/edit.html.haml", type: :view do 
  before(:each){@post = Post.create(title: "post", description: "description")}
  it 'render partial'do 
    render
    expect(response).to render_template(partial: "_form")
  end 

  it 'has label' do
    render 
    expect(rendered).to include("Title")
    expect(rendered).to include("Description")
  end

end