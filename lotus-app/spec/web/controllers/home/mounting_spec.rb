require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/mounting'

describe Web::Controllers::Home::Mounting do
  let(:action) { Web::Controllers::Home::Mounting.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
