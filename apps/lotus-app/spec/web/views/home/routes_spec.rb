require 'spec_helper'
require_relative '../../../../apps/web/views/home/routes'

describe Web::Views::Home::Routes do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/routes.html.erb') }
  let(:view)      { Web::Views::Home::Routes.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
