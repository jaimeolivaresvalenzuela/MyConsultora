require 'test_helper'

class ProyectoetapasControllerTest < ActionController::TestCase
  setup do
    @proyectoetapa = proyectoetapa(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectoetapa)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyectoetapa" do
    assert_difference('Proyectoetapa.count') do
      post :create, proyectoetapa: { etaid: @proyectoetapa.etaid, pretdescripcion: @proyectoetapa.pretdescripcion, pretestado: @proyectoetapa.pretestado, pretfechacreacion: @proyectoetapa.pretfechacreacion, proid: @proyectoetapa.proid, ropeid: @proyectoetapa.ropeid }
    end

    assert_redirected_to proyectoetapa_path(assigns(:proyectoetapa))
  end

  test "should show proyectoetapa" do
    get :show, id: @proyectoetapa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyectoetapa
    assert_response :success
  end

  test "should update proyectoetapa" do
    patch :update, id: @proyectoetapa, proyectoetapa: { etaid: @proyectoetapa.etaid, pretdescripcion: @proyectoetapa.pretdescripcion, pretestado: @proyectoetapa.pretestado, pretfechacreacion: @proyectoetapa.pretfechacreacion, proid: @proyectoetapa.proid, ropeid: @proyectoetapa.ropeid }
    assert_redirected_to proyectoetapa_path(assigns(:proyectoetapa))
  end

  test "should destroy proyectoetapa" do
    assert_difference('Proyectoetapa.count', -1) do
      delete :destroy, id: @proyectoetapa
    end

    assert_redirected_to proyectoetapas_path
  end
end
