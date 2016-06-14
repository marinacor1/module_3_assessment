require_relative '../test_helper'

class IndividualStoreFeatureTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_user_finds_individual_store_by_zip
    visit '/'

    fill_in('Search', :with => '80202')
    click_on 'Search'

    assert_equal '/search', current_path
    click_on 'Best Buy Mobile - Cherry Creek Shopping Center'

    assert page.has_content?('Name:')
    assert page.has_content?('Address:')
    assert page.has_content?('Store Hours:')

  end

end
