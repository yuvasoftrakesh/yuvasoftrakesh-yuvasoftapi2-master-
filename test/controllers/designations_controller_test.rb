require "test_helper"

class DesignationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @designation = designations(:one)
  end

  test "should get index" do
    get designations_url, as: :json
    assert_response :success
  end

  test "should create designation" do
    assert_difference('Designation.count') do
      post designations_url, params: { designation: { name: @designation.name } }, as: :json
    end

    assert_response 201
  end

  test "should show designation" do
    get designation_url(@designation), as: :json
    assert_response :success
  end

  test "should update designation" do
    patch designation_url(@designation), params: { designation: { name: @designation.name } }, as: :json
    assert_response 200
  end

  test "should destroy designation" do
    assert_difference('Designation.count', -1) do
      delete designation_url(@designation), as: :json
    end

    assert_response 204
  end
end
