require 'test_helper'

class TareasControllerTest < ActionController::TestCase
  setup do
    @tarea = tarea(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tarea)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tarea" do
    assert_difference('Tarea.count') do
      post :create, tarea: { tarestado: @tarea.tarestado, tarfechacreacion: @tarea.tarfechacreacion, tarnombre: @tarea.tarnombre }
    end

    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should show tarea" do
    get :show, id: @tarea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tarea
    assert_response :success
  end

  test "should update tarea" do
    patch :update, id: @tarea, tarea: { tarestado: @tarea.tarestado, tarfechacreacion: @tarea.tarfechacreacion, tarnombre: @tarea.tarnombre }
    assert_redirected_to tarea_path(assigns(:tarea))
  end

  test "should destroy tarea" do
    assert_difference('Tarea.count', -1) do
      delete :destroy, id: @tarea
    end

    assert_redirected_to tareas_path
  end
end
