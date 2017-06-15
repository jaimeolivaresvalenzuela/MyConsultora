require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = persona(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:persona)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { perapellidomaterno: @persona.perapellidomaterno, perapellidopaterno: @persona.perapellidopaterno, percargo: @persona.percargo, perdv: @persona.perdv, perestado: @persona.perestado, perfechacreacion: @persona.perfechacreacion, perfechaingreso: @persona.perfechaingreso, perfechanacimiento: @persona.perfechanacimiento, pernombre: @persona.pernombre, perrut: @persona.perrut }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { perapellidomaterno: @persona.perapellidomaterno, perapellidopaterno: @persona.perapellidopaterno, percargo: @persona.percargo, perdv: @persona.perdv, perestado: @persona.perestado, perfechacreacion: @persona.perfechacreacion, perfechaingreso: @persona.perfechaingreso, perfechanacimiento: @persona.perfechanacimiento, pernombre: @persona.pernombre, perrut: @persona.perrut }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
