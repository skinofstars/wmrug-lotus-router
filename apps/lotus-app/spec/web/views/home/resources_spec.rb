require 'spec_helper'
require_relative '../../../../apps/web/views/home/resources'

describe Web::Views::Home::Resources do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/resources.html.erb') }
  let(:view)      { Web::Views::Home::Resources.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
