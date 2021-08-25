require 'test_helper'

class LocalContratacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @local_contratacao = local_contratacaos(:one)
  end

  test "should get index" do
    get local_contratacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_local_contratacao_url
    assert_response :success
  end

  test "should create local_contratacao" do
    assert_difference('LocalContratacao.count') do
      post local_contratacaos_url, params: { local_contratacao: { descricao: @local_contratacao.descricao } }
    end

    assert_redirected_to local_contratacao_url(LocalContratacao.last)
  end

  test "should show local_contratacao" do
    get local_contratacao_url(@local_contratacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_local_contratacao_url(@local_contratacao)
    assert_response :success
  end

  test "should update local_contratacao" do
    patch local_contratacao_url(@local_contratacao), params: { local_contratacao: { descricao: @local_contratacao.descricao } }
    assert_redirected_to local_contratacao_url(@local_contratacao)
  end

  test "should destroy local_contratacao" do
    assert_difference('LocalContratacao.count', -1) do
      delete local_contratacao_url(@local_contratacao)
    end

    assert_redirected_to local_contratacaos_url
  end
end
