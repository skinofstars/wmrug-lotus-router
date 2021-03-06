require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/helpers'

describe Web::Controllers::Home::Helpers do
  let(:action) { Web::Controllers::Home::Helpers.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
