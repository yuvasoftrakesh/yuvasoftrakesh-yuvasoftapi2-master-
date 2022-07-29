require "test_helper"

class CompanyEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_event = company_events(:one)
  end

  test "should get index" do
    get company_events_url, as: :json
    assert_response :success
  end

  test "should create company_event" do
    assert_difference('CompanyEvent.count') do
      post company_events_url, params: { company_event: { category: @company_event.category, date: @company_event.date, description: @company_event.description, location: @company_event.location, title: @company_event.title } }, as: :json
    end

    assert_response 201
  end

  test "should show company_event" do
    get company_event_url(@company_event), as: :json
    assert_response :success
  end

  test "should update company_event" do
    patch company_event_url(@company_event), params: { company_event: { category: @company_event.category, date: @company_event.date, description: @company_event.description, location: @company_event.location, title: @company_event.title } }, as: :json
    assert_response 200
  end

  test "should destroy company_event" do
    assert_difference('CompanyEvent.count', -1) do
      delete company_event_url(@company_event), as: :json
    end

    assert_response 204
  end
end
