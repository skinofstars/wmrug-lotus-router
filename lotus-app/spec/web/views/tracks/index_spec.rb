require 'spec_helper'
require_relative '../../../../apps/web/views/tracks/index'

describe Web::Views::Tracks::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/tracks/index.html.erb') }
  let(:view)      { Web::Views::Tracks::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
