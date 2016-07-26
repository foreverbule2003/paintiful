require 'rails_helper'

RSpec.describe 'posts', type: :routing do 
  it '#index' do 
    expect(get: '/posts').to route_to('posts#index')
  end

  it '#show' do 
    expect(get: '/posts/1').to route_to(controller: 'posts',
                                        action: 'show', 
                                        id: '1')
  end

  it '#new' do
    expect(get: 'posts/new').to route_to('posts#new')
  end

  it '#edit' do 
    expect(get: 'posts/1/edit').to route_to(controller: 'posts',
                                            action: 'edit',
                                            id: '1')
  end

  it '#create' do
    expect(post: 'posts').to route_to('posts#create')
  end

  it '#update' do 
    expect(put: 'posts/1').to route_to(controller: 'posts',
                                        action: 'update', 
                                        id: '1')
  end

  it '#destroy' do 
    expect(delete: 'posts/1').to route_to(controller: 'posts',
                                          action: 'destroy',
                                          id:'1')
  end

  it '#like' do 
    expect(get: 'posts/1/like').to route_to(controller: 'posts',
                                         action: 'like',
                                         id: '1')
  end
end