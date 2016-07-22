require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do 
    def current_user
      User.first
    end
  end
  it "#index" do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  xit "#new" do
    get :new

  end
end