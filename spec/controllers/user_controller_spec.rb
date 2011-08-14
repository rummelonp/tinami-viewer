# -*- coding: utf-8 -*-
require 'spec_helper'

describe UserController do
  before do
    session[:auth_key] = '*** auth key ***'

    @client = TINAMI.client

    @content = Hashie::Mash.new({
      id: '1',
      type: 'illust',
      thumbnails: {
        thumbnail_150x150: {
          url: 'http://example.com/illust.gif'
        }
      }
    })

    @contents = [@content] * 10
    @contents_data = Hashie::Mash.new({contents: @contents})
  end

  describe "GET 'bookmark_contents'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:bookmark_contents).and_return(@contents_data)
      get :bookmark_contents
      response.should be_success
    end
  end

  describe "GET 'watchkeyword_contents'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:watchkeyword_contents).and_return(@contents_data)
      get :watchkeyword_contents
      response.should be_success
    end
  end

  describe "GET 'friend_recommends'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:friend_recommends).and_return(@contents_data)
      get :friend_recommends
      response.should be_success
    end
  end

  describe "GET 'collections'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:collections).and_return(@contents_data)
      get :collections
      response.should be_success
    end
  end

  describe "GET 'bookmarks'" do
    before do
      @creator = Hashie::Mash.new({
        id: "1",
        name: "creator",
        thumbnail: "http://example.com/creator.png"
      })
      @creators = [@creator] * 10
      @creators_data = Hashie::Mash.new({creators: @creators})
    end

    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:bookmarks).and_return(@creators_data)
      get :bookmarks
      response.should be_success
    end
  end

  describe "POST 'support'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:support).with('1')
      xhr :post, :support, cont_id: 1
      response.should be_success
    end
  end

  describe "POST 'add_collection'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:add_collection).with('1')
      xhr :post, :add_collection, cont_id: 1
      response.should be_success
    end
  end

  describe "POST 'add_bookmark'" do
    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:add_bookmark).with('1')
      xhr :post, :add_bookmark, prof_id: 1
      response.should be_success
    end
  end

  describe "POST 'comments'" do
    before do
      @comments = ['comment'] * 10
      @comments_data = Hashie::Mash.new({comments: @comments})
    end

    it "should be successful" do
      TINAMI.should_receive(:client).and_return(@client)
      @client.should_receive(:comments).with('1').and_return(@comments_data)
      xhr :get, :comments, cont_id: 1
      response.should be_success
    end
  end

  describe "GET 'add_comment'" do
    it "should be successful"
  end

  describe "GET 'remove_comment'" do
    it "should be successful"
  end

end
