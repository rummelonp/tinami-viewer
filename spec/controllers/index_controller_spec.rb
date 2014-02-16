require 'hashie/mash'
require 'spec_helper'

describe IndexController do
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

  let(:content_data) { Hashie::Mash.new(content: content) }

  let(:contents) { [content] * 10 }

  let(:contents_data) { Hashie::Mash.new(contents: contents) }

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'ranking'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:ranking).with('0').and_return(contents_data)
      get :ranking, category: 0
      expect(response).to be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:get).and_return(contents_data)
      get :search
      expect(response).to be_success
    end
  end

  describe "GET 'content'" do
    it "should be successful" do
      allow(TINAMI).to receive(:new).and_return(client)
      expect(client).to receive(:content).with('1').and_return(content_data)
      get :content, cont_id: 1
      expect(response).to be_success
    end
  end

  describe "GET 'auth'" do
    it "should be successful" do
      get :auth
      expect(response).to be_success
    end
  end

  describe "POST 'auth'" do
    context "authenticated" do
      let(:auth_key) { 'auth_key' }

      let(:auth_data) { Hashie::Mash.new(auth_key: auth_key) }

      before do
        allow(TINAMI).to receive(:auth).and_return(auth_data)
        post :auth
      end

      it 'should be redirect to index' do
        expect(response).to be_redirect
      end

      it 'session have auth key' do
        expect(session[:auth_key]).to eql(auth_data.auth_key)
      end
    end

    context 'login failure' do
      before do
        allow(TINAMI).to receive(:auth).and_raise(TINAMI::FailError)
        post :auth
      end

      it 'should be successful' do
        expect(response).to be_success
      end

      it 'flash should have error message' do
        expect(flash[:notice]).to be_present
      end
    end
  end

  describe "GET 'logout'" do
    before do
      allow(TINAMI).to receive(:logout)
    end

    it 'should be redirect to index' do
      get :logout
      expect(response).to be_redirect
    end
  end

end
