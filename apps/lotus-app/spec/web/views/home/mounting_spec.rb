require 'spec_helper'
require_relative '../../../../apps/web/views/home/mounting'

describe Web::Views::Home::Mounting do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/mounting.html.erb') }
  let(:view)      { Web::Views::Home::Mounting.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
