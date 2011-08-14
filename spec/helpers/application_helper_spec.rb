require 'spec_helper'

describe ApplicationHelper do

  describe :authenticated? do
    context 'session have auth key' do
      before do
        session[:auth_key] = '*** auth key ***'
      end

      it 'should be true' do
        authenticated?.should be_true
      end
    end

    context 'session not have auth key' do
      before do
        session[:auth_key] = nil
      end

      it 'should be false' do
        authenticated?.should be_false
      end
    end
  end

end
