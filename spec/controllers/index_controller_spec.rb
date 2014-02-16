require 'hashie/mash'
require 'spec_helper'

describe IndexController do
  before do
    @client = TINAMI.new

    @content = Hashie::Mash.new({
      id: '1',
      type: 'illust',
      thumbnails: {
        thumbnail_150x150: {
          url: 'http://example.com/illust.gif'
        }
      }
    })
    @content_data = Hashie::Mash.new({content: @content})

    @contents = [@content] * 10
    @contents_data = Hashie::Mash.new({contents: @contents})
  end

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'ranking'" do
    it "should be successful" do
      TINAMI.should_receive(:new).and_return(@client)
      @client.should_receive(:ranking).with('0').and_return(@contents_data)
      get :ranking, category: 0
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      TINAMI.should_receive(:new).and_return(@client)
      @client.should_receive(:get).and_return(@contents_data)
      get :search
      response.should be_success
    end
  end

  describe "GET 'content'" do
    it "should be successful" do
      TINAMI.should_receive(:new).and_return(@client)
      @client.should_receive(:content).with('1').and_return(@content_data)
      get :content, cont_id: 1
      response.should be_success
    end
  end

  describe "GET 'auth'" do
    it "should be successful" do
      get :auth
      response.should be_success
    end
  end

  describe "POST 'auth'" do
    context "authenticated" do
      before do
        @auth_data = Hashie::Mash.new({
          auth_key: '*** auth key ***'
        })
        TINAMI.should_receive(:auth).and_return(@auth_data)
        post :auth
      end

      it 'should be redirect to index' do
        response.should be_redirect
      end

      it 'session have auth key' do
        session[:auth_key].should == @auth_data.auth_key
      end
    end

    context 'login failure' do
      before do
        TINAMI.should_receive(:auth).and_raise(TINAMI::FailError)
        post :auth
      end

      it 'should be successful' do
        response.should be_success
      end

      it 'flash should have error message' do
        flash[:notice].should be_present
      end
    end
  end

  describe "GET 'logout'" do
    before do
      TINAMI.should_receive(:logout)
    end

    it 'should be redirect to index' do
      get :logout
      response.should be_redirect
    end
  end

end
