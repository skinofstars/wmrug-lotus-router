require 'spec_helper'
require_relative '../../../../apps/web/controllers/tracks/create'

describe Web::Controllers::Tracks::Create do
  let(:action) { Web::Controllers::Tracks::Create.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
