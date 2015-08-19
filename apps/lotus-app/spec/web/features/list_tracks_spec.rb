# spec/web/features/list_tracks_spec.rb
require 'features_helper'

describe 'List tracks' do
  it 'displays each track on the page' do
    visit '/tracks'

    within '#tracks' do
      assert page.has_css?('.track', count: 2), "Expected to find 2 tracks"
    end
  end
end
