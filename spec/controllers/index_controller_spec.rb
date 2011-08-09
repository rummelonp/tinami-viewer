require 'spec_helper'

describe IndexController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'ranking'" do
    it "should be successful" do
      get 'ranking'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'content'" do
    it "should be successful" do
      get 'content'
      response.should be_success
    end
  end

  describe "GET 'auth'" do
    it "should be successful" do
      get 'auth'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "should be successful" do
      get 'logout'
      response.should be_success
    end
  end

end
