require 'spec_helper'

describe :routes do

  describe 'GET ""' do
    subject { {get: '/'} }
    it { should route_to(controller: 'index', action: 'index') }
  end

  describe 'GET "auth"' do
    subject { {get: '/auth'} }
    it { should route_to(controller: 'index', action: 'auth') }
  end

  describe 'POST "auth"' do
    subject { {post: '/auth'} }
    it { should route_to(controller: 'index', action: 'auth') }
  end

  describe 'GET "logout"' do
    subject { {get: '/logout'} }
    it { should route_to(controller: 'index', action: 'logout') }
  end

  describe 'GET "search"' do
    subject { {get: '/search'} }
    it { should route_to(controller: 'index', action: 'search') }
  end

  describe 'GET "ranking/0"' do
    subject { {get: '/ranking/0'} }
    it { should route_to(controller: 'index', action: 'ranking', category: '0') }
  end

  describe 'GET "content/1"' do
    subject { {get: '/content/1'} }
    it { should route_to(controller: 'index', action: 'content', cont_id: '1') }
  end

  describe 'GET "content/1/comments"' do
    subject { {get: '/content/1/comments'} }
    it { should route_to(controller: 'user', action: 'comments', cont_id: '1') }
  end

  describe 'POST "content/1/comments"' do
    subject { {post: '/content/1/comments', comment: 'comment'} }
    it { should route_to(controller: 'user', action: 'add_comment', cont_id: '1') }
  end

  describe 'DELETE "content/1/comments/1"' do
    subject { {delete: '/content/1/comments/1'} }
    it { should route_to(controller: 'user', action: 'remove_comment', cont_id: '1', comment_id: '1') }
  end

  describe 'GET "watchkeyword/contents"' do
    subject { {get: '/watchkeyword/contents'} }
    it { should route_to(controller: 'user', action: 'watchkeyword_contents') }
  end

  describe 'GET "friend/recommend/contents"' do
    subject { {get: '/friend/recommend/contents'} }
    it { should route_to(controller: 'user', action: 'friend_recommends') }
  end

  describe 'GET "collections"' do
    subject { {get: '/collections'} }
    it { should route_to(controller: 'user', action: 'collections') }
  end

  describe 'POST "collections"' do
    subject { {post: '/collections'} }
    it { should route_to(controller: 'user', action: 'add_collection') }
  end

  describe 'GET "bookmarks/contents"' do
    subject { {get: '/bookmarks/contents'} }
    it { should route_to(controller: 'user', action: 'bookmark_contents') }
  end

  describe 'GET "bookmarks"' do
    subject { {get: '/bookmarks'} }
    it { should route_to(controller: 'user', action: 'bookmarks') }
  end

  describe 'POST "bookmark"' do
    subject { {post: '/bookmarks'} }
    it { should route_to(controller: 'user', action: 'add_bookmark') }
  end

  describe 'POST "support"' do
    subject { {post: '/support'} }
    it { should route_to(controller: 'user', action: 'support') }
  end

end
