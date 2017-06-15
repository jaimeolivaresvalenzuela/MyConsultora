require 'test_helper'

class EtapatareasControllerTest < ActionController::TestCase
  setup do
    @etapatarea = etapatarea(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etapatarea)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etapatarea" do
    assert_difference('Etapatarea.count') do
      post :create, etapatarea: { ettadescripcion: @etapatarea.ettadescripcion, ettaestado: @etapatarea.ettaestado, ettafechacreacion: @etapatarea.ettafechacreacion, pretid: @etapatarea.pretid, ropeid: @etapatarea.ropeid, tarid: @etapatarea.tarid }
    end

    assert_redirected_to etapatarea_path(assigns(:etapatarea))
  end

  test "should show etapatarea" do
    get :show, id: @etapatarea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @etapatarea
    assert_response :success
  end

  test "should update etapatarea" do
    patch :update, id: @etapatarea, etapatarea: { ettadescripcion: @etapatarea.ettadescripcion, ettaestado: @etapatarea.ettaestado, ettafechacreacion: @etapatarea.ettafechacreacion, pretid: @etapatarea.pretid, ropeid: @etapatarea.ropeid, tarid: @etapatarea.tarid }
    assert_redirected_to etapatarea_path(assigns(:etapatarea))
  end

  test "should destroy etapatarea" do
    assert_difference('Etapatarea.count', -1) do
      delete :destroy, id: @etapatarea
    end

    assert_redirected_to etapatareas_path
  end
end
