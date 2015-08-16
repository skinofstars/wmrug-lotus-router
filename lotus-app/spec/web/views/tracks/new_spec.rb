require 'spec_helper'
require_relative '../../../../apps/web/views/tracks/new'

describe Web::Views::Tracks::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/tracks/new.html.erb') }
  let(:view)      { Web::Views::Tracks::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
