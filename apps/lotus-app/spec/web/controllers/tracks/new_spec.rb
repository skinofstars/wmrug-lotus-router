require 'spec_helper'
require_relative '../../../../apps/web/controllers/tracks/new'

describe Web::Controllers::Tracks::New do
  let(:action) { Web::Controllers::Tracks::New.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
