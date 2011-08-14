require 'spec_helper'

describe ApplicationController do

  describe :client do
    it 'should be a TINAMI::Client' do
      controller.client.should be_a TINAMI::Client
    end
  end

end
