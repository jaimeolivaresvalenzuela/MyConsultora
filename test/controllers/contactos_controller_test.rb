require 'test_helper'

class ContactosControllerTest < ActionController::TestCase
  setup do
    @contacto = contacto(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacto)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contacto" do
    assert_difference('Contacto.count') do
      post :create, contacto: { cliid: @contacto.cliid, conapellidomaterno: @contacto.conapellidomaterno, conapellidopaterno: @contacto.conapellidopaterno, concargo: @contacto.concargo, conestado: @contacto.conestado, confechacreacion: @contacto.confechacreacion, conmail: @contacto.conmail, connombre: @contacto.connombre, contelefono: @contacto.contelefono }
    end

    assert_redirected_to contacto_path(assigns(:contacto))
  end

  test "should show contacto" do
    get :show, id: @contacto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contacto
    assert_response :success
  end

  test "should update contacto" do
    patch :update, id: @contacto, contacto: { cliid: @contacto.cliid, conapellidomaterno: @contacto.conapellidomaterno, conapellidopaterno: @contacto.conapellidopaterno, concargo: @contacto.concargo, conestado: @contacto.conestado, confechacreacion: @contacto.confechacreacion, conmail: @contacto.conmail, connombre: @contacto.connombre, contelefono: @contacto.contelefono }
    assert_redirected_to contacto_path(assigns(:contacto))
  end

  test "should destroy contacto" do
    assert_difference('Contacto.count', -1) do
      delete :destroy, id: @contacto
    end

    assert_redirected_to contactos_path
  end
end
