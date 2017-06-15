require 'test_helper'

class RolpersonasControllerTest < ActionController::TestCase
  setup do
    @rolpersona = rolpersona(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rolpersona)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rolpersona" do
    assert_difference('Rolpersona.count') do
      post :create, rolpersona: { perid: @rolpersona.perid, rolid: @rolpersona.rolid, ropedescripcion: @rolpersona.ropedescripcion, ropeestado: @rolpersona.ropeestado, ropefechacreacion: @rolpersona.ropefechacreacion }
    end

    assert_redirected_to rolpersona_path(assigns(:rolpersona))
  end

  test "should show rolpersona" do
    get :show, id: @rolpersona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rolpersona
    assert_response :success
  end

  test "should update rolpersona" do
    patch :update, id: @rolpersona, rolpersona: { perid: @rolpersona.perid, rolid: @rolpersona.rolid, ropedescripcion: @rolpersona.ropedescripcion, ropeestado: @rolpersona.ropeestado, ropefechacreacion: @rolpersona.ropefechacreacion }
    assert_redirected_to rolpersona_path(assigns(:rolpersona))
  end

  test "should destroy rolpersona" do
    assert_difference('Rolpersona.count', -1) do
      delete :destroy, id: @rolpersona
    end

    assert_redirected_to rolpersonas_path
  end
end
