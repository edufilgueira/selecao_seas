require 'test_helper'

class RecursoServidorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurso_servidor = recurso_servidors(:one)
  end

  test "should get index" do
    get recurso_servidors_url
    assert_response :success
  end

  test "should get new" do
    get new_recurso_servidor_url
    assert_response :success
  end

  test "should create recurso_servidor" do
    assert_difference('RecursoServidor.count') do
      post recurso_servidors_url, params: { recurso_servidor: { inscricao_servidor_id: @recurso_servidor.inscricao_servidor_id, texto: @recurso_servidor.texto } }
    end

    assert_redirected_to recurso_servidor_url(RecursoServidor.last)
  end

  test "should show recurso_servidor" do
    get recurso_servidor_url(@recurso_servidor)
    assert_response :success
  end

  test "should get edit" do
    get edit_recurso_servidor_url(@recurso_servidor)
    assert_response :success
  end

  test "should update recurso_servidor" do
    patch recurso_servidor_url(@recurso_servidor), params: { recurso_servidor: { inscricao_servidor_id: @recurso_servidor.inscricao_servidor_id, texto: @recurso_servidor.texto } }
    assert_redirected_to recurso_servidor_url(@recurso_servidor)
  end

  test "should destroy recurso_servidor" do
    assert_difference('RecursoServidor.count', -1) do
      delete recurso_servidor_url(@recurso_servidor)
    end

    assert_redirected_to recurso_servidors_url
  end
end
