require 'test_helper'

class MealJournalsControllerTest < ActionController::TestCase
  setup do
    @meal_journal = meal_journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meal_journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meal_journal" do
    assert_difference('MealJournal.count') do
      post :create, meal_journal: { ate: @meal_journal.ate, date: @meal_journal.date, meal: @meal_journal.meal, meal_day_id: @meal_journal.meal_day_id, user_id: @meal_journal.user_id }
    end

    assert_redirected_to meal_journal_path(assigns(:meal_journal))
  end

  test "should show meal_journal" do
    get :show, id: @meal_journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meal_journal
    assert_response :success
  end

  test "should update meal_journal" do
    patch :update, id: @meal_journal, meal_journal: { ate: @meal_journal.ate, date: @meal_journal.date, meal: @meal_journal.meal, meal_day_id: @meal_journal.meal_day_id, user_id: @meal_journal.user_id }
    assert_redirected_to meal_journal_path(assigns(:meal_journal))
  end

  test "should destroy meal_journal" do
    assert_difference('MealJournal.count', -1) do
      delete :destroy, id: @meal_journal
    end

    assert_redirected_to meal_journals_path
  end
end
