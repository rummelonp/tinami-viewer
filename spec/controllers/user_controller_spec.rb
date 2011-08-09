require 'spec_helper'

describe UserController do

  describe "GET 'bookmark_contents'" do
    it "should be successful" do
      get 'bookmark_contents'
      response.should be_success
    end
  end

  describe "GET 'watchkeyword_contents'" do
    it "should be successful" do
      get 'watchkeyword_contents'
      response.should be_success
    end
  end

  describe "GET 'friend_recommends'" do
    it "should be successful" do
      get 'friend_recommends'
      response.should be_success
    end
  end

  describe "GET 'collections'" do
    it "should be successful" do
      get 'collections'
      response.should be_success
    end
  end

  describe "GET 'bookmarks'" do
    it "should be successful" do
      get 'bookmarks'
      response.should be_success
    end
  end

  describe "GET 'support'" do
    it "should be successful" do
      get 'support'
      response.should be_success
    end
  end

  describe "GET 'add_collection'" do
    it "should be successful" do
      get 'add_collection'
      response.should be_success
    end
  end

  describe "GET 'add_bookmark'" do
    it "should be successful" do
      get 'add_bookmark'
      response.should be_success
    end
  end

  describe "GET 'comments'" do
    it "should be successful" do
      get 'comments'
      response.should be_success
    end
  end

  describe "GET 'add_comment'" do
    it "should be successful" do
      get 'add_comment'
      response.should be_success
    end
  end

  describe "GET 'remove_comment'" do
    it "should be successful" do
      get 'remove_comment'
      response.should be_success
    end
  end

end
