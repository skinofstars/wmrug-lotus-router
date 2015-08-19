require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/resources'

describe Web::Controllers::Home::Resources do
  let(:action) { Web::Controllers::Home::Resources.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
