require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do 
    @post1 = Post.create(title: "Post1", like: 10)
    @post2 = Post.create(title: "Post2")
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
    @post1 = Post.create(title: "Post1")
    get :show, id: @post1[:id]#Verb: get, URI Pattern: /posts/:id
  end

  it "#edit" do
    get :edit, id: @post1[:id]
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
      post :update, post: @post_params, id: @post1[:id]
      expect(Post.find_by_id(@post1).title).to eq("post ver.edit")
    end

    it "redirect on success" do 
      post :update, post: @post_params, id: @post1[:id]
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(post_path(@post1))
    end

    it "render :update on fail" do
      allow_any_instance_of(Post).to receive(:update).and_return(false)
      post :update, post: @post_params, id: @post1[:id]
      expect(response).to render_template(:edit)      
    end
  end

  describe "destroy" do
    before(:each) do 
      @del_me = @post1 || Post.create(title: "del_me")
    end

    it "destroy record" do 
      expect{ delete :destroy, id: @del_me.id}.to change{Post.all.size}.by(-1)
    end

    it "redirect to index" do 
      delete :destroy, id: @del_me.id
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(:root)
    end
  end

  describe "like" do 
    before(:each) do 
      request.env["HTTP_REFERER"] = "where_i_come_from"
    end

    it "do_like" do
      # byebug
      # expect{ get :like, id: @post1.id }.to change{@post1.like}.by(1)
    end

    it "go back" do 
      # request.env["HTTP_REFERER"] = "where_i_come_from"
      # get 'goback'
      expect(response).to "where_i_come_from"
      # response.should redirect_to "where_i_come_from"
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