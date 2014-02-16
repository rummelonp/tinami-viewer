require 'hashie/mash'
require 'spec_helper'

describe UserController do
  let(:auth_key) { 'auth_key' }

  let(:client) { TINAMI.new }

  let(:content) do
    Hashie::Mash.new(
      id: '1',
      type: 'illust',
      thumbnails: {
        thumbnail_150x150: {
          url: 'http://example.com/illust.gif'
        },
      },
    )
  end

  let(:contents) { [content] * 10 }

  let(:contents_data) { Hashie::Mash.new(contents: contents) }

  before do
    session[:auth_key] = auth_key
  end

  describe "GET 'bookmark_contents'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:bookmark_contents).and_return(contents_data)
      get :bookmark_contents
      expect(response).to be_success
    end
  end

  describe "GET 'watchkeyword_contents'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:watchkeyword_contents).and_return(contents_data)
      get :watchkeyword_contents
      expect(response).to be_success
    end
  end

  describe "GET 'friend_recommends'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:friend_recommends).and_return(contents_data)
      get :friend_recommends
      expect(response).to be_success
    end
  end

  describe "GET 'collections'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:collections).and_return(contents_data)
      get :collections
      expect(response).to be_success
    end
  end

  describe "GET 'bookmarks'" do
    let(:creator) do
      Hashie::Mash.new(
        id: "1",
        name: "creator",
        thumbnail: "http://example.com/creator.png",
      )
    end

    let(:creators) { [creator] * 10 }

    let(:creators_data) { Hashie::Mash.new(creators: creators) }

    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:bookmarks).and_return(creators_data)
      get :bookmarks
      expect(response).to be_success
    end
  end

  describe "POST 'support'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:support).with('1')
      xhr :post, :support, cont_id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'add_collection'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:add_collection).with('1')
      xhr :post, :add_collection, cont_id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'add_bookmark'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:add_bookmark).with('1')
      xhr :post, :add_bookmark, prof_id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'comments'" do
    let(:comments) { ['comment'] * 10 }

    let(:comments_data) { Hashie::Mash.new(comments: comments) }

    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:comments).with('1').and_return(comments_data)
      xhr :get, :comments, cont_id: 1
      expect(response).to be_success
    end
  end

  describe "POST 'add_comment'" do
    context "add comment successful" do
      before do
        allow(TINAMI).to receive(:new).and_return(client)
        expect(client).to receive(:add_comment).with('1', 'comment')
        post :add_comment, cont_id: 1, comment: 'comment'
      end

      it "should be redirect to content" do
        expect(response).to be_redirect
      end

      it 'flash should not have error message' do
        expect(flash[:notice]).to be_blank
      end
    end

    context "add comment failure" do
      before do
        allow(TINAMI).to receive(:new).and_return(client)
        expect(client).to receive(:add_comment).with('1', '').and_raise(TINAMI::FailError)
        post :add_comment, cont_id: 1, comment: ''
      end

      it "should be redirect to content" do
        expect(response).to be_redirect
      end

      it 'flash should have error message' do
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe "GET 'remove_comment'" do
    it "should be successful"
  end

end
