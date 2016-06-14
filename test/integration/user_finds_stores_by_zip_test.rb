require_relative '../test_helper'

class ItemsFeatureTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_user_finds_stores_by_zip
    visit '/'

    fill_in('Search', :with => '80202')
    click_on 'Search'

    assert_equal '/search', current_path
    assert page.has_content?('Stores 25 miles of 80202')
    assert page.has_content?('17 Total Stores')
    #exactly 15 results
    assert page.has_content?('Long Name:')
    assert page.has_content?('City:')
    assert page.has_content?('Distance:')
    assert page.has_content?('Phone:')
    assert page.has_content?('Store Type:')

  end

end
