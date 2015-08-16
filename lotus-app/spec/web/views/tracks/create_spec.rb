require 'spec_helper'
require_relative '../../../../apps/web/views/tracks/create'

describe Web::Views::Tracks::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/tracks/create.html.erb') }
  let(:view)      { Web::Views::Tracks::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
