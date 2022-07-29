require "test_helper"

class ClientstetimonialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clientstetimonial = clientstetimonials(:one)
  end

  test "should get index" do
    get clientstetimonials_url, as: :json
    assert_response :success
  end

  test "should create clientstetimonial" do
    assert_difference('Clientstetimonial.count') do
      post clientstetimonials_url, params: { clientstetimonial: { city: @clientstetimonial.city, description: @clientstetimonial.description, name: @clientstetimonial.name } }, as: :json
    end

    assert_response 201
  end

  test "should show clientstetimonial" do
    get clientstetimonial_url(@clientstetimonial), as: :json
    assert_response :success
  end

  test "should update clientstetimonial" do
    patch clientstetimonial_url(@clientstetimonial), params: { clientstetimonial: { city: @clientstetimonial.city, description: @clientstetimonial.description, name: @clientstetimonial.name } }, as: :json
    assert_response 200
  end

  test "should destroy clientstetimonial" do
    assert_difference('Clientstetimonial.count', -1) do
      delete clientstetimonial_url(@clientstetimonial), as: :json
    end

    assert_response 204
  end
end
