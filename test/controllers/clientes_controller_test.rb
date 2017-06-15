require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = cliente(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cliente)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { clidireccion: @cliente.clidireccion, clidv: @cliente.clidv, cliestado: @cliente.cliestado, clifechacreacion: @cliente.clifechacreacion, clinombre: @cliente.clinombre, clirazonsocial: @cliente.clirazonsocial, clirut: @cliente.clirut }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { clidireccion: @cliente.clidireccion, clidv: @cliente.clidv, cliestado: @cliente.cliestado, clifechacreacion: @cliente.clifechacreacion, clinombre: @cliente.clinombre, clirazonsocial: @cliente.clirazonsocial, clirut: @cliente.clirut }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
