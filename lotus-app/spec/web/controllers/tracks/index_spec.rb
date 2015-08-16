require 'spec_helper'
require_relative '../../../../apps/web/controllers/tracks/index'

describe Web::Controllers::Tracks::Index do
  let(:action) { Web::Controllers::Tracks::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
