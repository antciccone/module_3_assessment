require 'rails_helper'

describe 'IntegrationTest' do
  it 'reaches out to the root page' do

    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?('Items'), "page should have an Items heading"
    end
  end
end
