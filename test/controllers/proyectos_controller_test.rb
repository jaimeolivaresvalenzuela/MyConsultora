require 'test_helper'

class ProyectosControllerTest < ActionController::TestCase
  setup do
    @proyecto = proyecto(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyecto)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto" do
    assert_difference('Proyecto.count') do
      post :create, proyecto: { cueid: @proyecto.cueid, prodescripcion: @proyecto.prodescripcion, proestado: @proyecto.proestado, profechacreacion: @proyecto.profechacreacion, pronombre: @proyecto.pronombre, ropeid: @proyecto.ropeid }
    end

    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should show proyecto" do
    get :show, id: @proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto
    assert_response :success
  end

  test "should update proyecto" do
    patch :update, id: @proyecto, proyecto: { cueid: @proyecto.cueid, prodescripcion: @proyecto.prodescripcion, proestado: @proyecto.proestado, profechacreacion: @proyecto.profechacreacion, pronombre: @proyecto.pronombre, ropeid: @proyecto.ropeid }
    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should destroy proyecto" do
    assert_difference('Proyecto.count', -1) do
      delete :destroy, id: @proyecto
    end

    assert_redirected_to proyectos_path
  end
end
