require_relative '../test_helper'

class IndividaulStoreFeatureTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_user_finds_individual_store_by_zip
    visit '/'

    fill_in('Search', :with => '80202')
    click_on 'Search'

    assert_equal '/search', current_path
    click_on 'Best Buy Mobile - Cherry Creek Shopping Center'


    assert_equal '/stores/2740', current_path

    assert page.has_content?('Name:')
    assert page.has_content?('Address:')
    assert page.has_content?('City:')
    assert page.has_content?('State:')
    assert page.has_content?('Zip Code:')
    assert page.has_content?('Store Hours:')

  end

end
