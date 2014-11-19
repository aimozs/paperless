require 'test_helper'

class MealDaysControllerTest < ActionController::TestCase
  setup do
    @meal_day = meal_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meal_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meal_day" do
    assert_difference('MealDay.count') do
      post :create, meal_day: { breakfast: @meal_day.breakfast, date: @meal_day.date, day: @meal_day.day, dinner: @meal_day.dinner, lunch: @meal_day.lunch, meal_plan_id: @meal_day.meal_plan_id, snack: @meal_day.snack }
    end

    assert_redirected_to meal_day_path(assigns(:meal_day))
  end

  test "should show meal_day" do
    get :show, id: @meal_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meal_day
    assert_response :success
  end

  test "should update meal_day" do
    patch :update, id: @meal_day, meal_day: { breakfast: @meal_day.breakfast, date: @meal_day.date, day: @meal_day.day, dinner: @meal_day.dinner, lunch: @meal_day.lunch, meal_plan_id: @meal_day.meal_plan_id, snack: @meal_day.snack }
    assert_redirected_to meal_day_path(assigns(:meal_day))
  end

  test "should destroy meal_day" do
    assert_difference('MealDay.count', -1) do
      delete :destroy, id: @meal_day
    end

    assert_redirected_to meal_days_path
  end
end
