require 'spec_helper'
require_relative '../../../../apps/web/views/home/helpers'

describe Web::Views::Home::Helpers do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/helpers.html.erb') }
  let(:view)      { Web::Views::Home::Helpers.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
