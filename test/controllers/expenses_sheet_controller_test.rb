require 'test_helper'

class ExpensesSheetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get expenses_sheet_index_url
    assert_response :success
  end

end
