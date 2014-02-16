require 'spec_helper'

describe ApplicationController do

  describe :client do
    it 'should be a TINAMI::Client' do
      expect(controller.client).to be_is_a(TINAMI::Client)
    end
  end

end
