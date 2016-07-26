require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do 
    @post = Post.create(title: "Post", like: 1)
    @post_params = {title: "Post"}

  end
  it "#index" do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it "#new" do
    login_user
    get :new
  end

  it "#show" do 
    get :show, id: @post.id#Verb: get, URI Pattern: /posts/:id
  end

  it "#edit" do
    get :edit, id: @post[:id]
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe "#create" do
    it "create post" do
      login_user
      expect{ post :create, post: @post_params }.to change{Post.all.size}.by(1)
    end

    it "redirect on success" do 
      login_user
      post :create, post: @post_params
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(post_path(Post.last))
    end

    it "render :new on fail" do 
      allow_any_instance_of(Post).to receive(:save).and_return(false)
      login_user
      post :create, post: @post_params
      expect(response).to render_template(:new)
    end
  end

  describe "#update" do
    before(:all)do 
      @post_params = {title: "post ver.edit"}
    end
    it "update post" do
      post :update, post: @post_params, id: @post[:id]
      expect(Post.find_by_id(@post).title).to eq("post ver.edit")
    end

    it "redirect on success" do 
      post :update, post: @post_params, id: @post[:id]
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(post_path(@post))
    end

    it "render :update on fail" do
      allow_any_instance_of(Post).to receive(:update).and_return(false)
      post :update, post: @post_params, id: @post[:id]
      expect(response).to render_template(:edit)      
    end
  end

  describe "destroy" do
    before(:each) do 
      @del_me = @post || Post.create(title: "del_me")
    end

    it "destroy record" do 
      expect{ delete :destroy, id: @del_me.id}.to change{Post.all.size}.by(-1)
      #same as above
      # post_size = Post.all.size
      # delete :destroy, id: @del_me.id
      # expect(Post.all.size).to eq(post_size - 1) 
    end

    it "redirect to index" do 
      delete :destroy, id: @del_me.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(:root)
    end
  end

  describe "like" do 
    before(:each) do 
      request.env["HTTP_REFERER"] = "current_place"
    end

    it "do_like" do
      # expect{ get :like, id: @post[:id] }.to change{ @post.like }.by(1)
      expect{ get :like, id: Post.last.id }.to change{ Post.last.like }.by(1)
      expect(response).to redirect_to "current_place"
    end
  end
end

def login_user
  @request.env["devise.mapping"] = Devise.mappings[:admin]
  admin = FactoryGirl.create(:admin)
  sign_in :user, admin # sign_in(scope, resource)
end
FactoryGirl.define do
  factory :admin, class: User do
    email 'aaa@bbbcom'
    password '12345678'
  end
end