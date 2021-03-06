require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/routes'

describe Web::Controllers::Home::Routes do
  let(:action) { Web::Controllers::Home::Routes.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
