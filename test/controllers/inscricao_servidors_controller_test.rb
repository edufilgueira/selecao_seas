require 'test_helper'

class InscricaoServidorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscricao_servidor = inscricao_servidors(:one)
  end

  test "should get index" do
    get inscricao_servidors_url
    assert_response :success
  end

  test "should get new" do
    get new_inscricao_servidor_url
    assert_response :success
  end

  test "should create inscricao_servidor" do
    assert_difference('InscricaoServidor.count') do
      post inscricao_servidors_url, params: { inscricao_servidor: {  } }
    end

    assert_redirected_to inscricao_servidor_url(InscricaoServidor.last)
  end

  test "should show inscricao_servidor" do
    get inscricao_servidor_url(@inscricao_servidor)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscricao_servidor_url(@inscricao_servidor)
    assert_response :success
  end

  test "should update inscricao_servidor" do
    patch inscricao_servidor_url(@inscricao_servidor), params: { inscricao_servidor: {  } }
    assert_redirected_to inscricao_servidor_url(@inscricao_servidor)
  end

  test "should destroy inscricao_servidor" do
    assert_difference('InscricaoServidor.count', -1) do
      delete inscricao_servidor_url(@inscricao_servidor)
    end

    assert_redirected_to inscricao_servidors_url
  end
end
