require 'test_helper'

class RegiaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @regiao = regiaos(:one)
  end

  test "should get index" do
    get regiaos_url
    assert_response :success
  end

  test "should get new" do
    get new_regiao_url
    assert_response :success
  end

  test "should create regiao" do
    assert_difference('Regiao.count') do
      post regiaos_url, params: { regiao: { descricao: @regiao.descricao, inscricao_lideranca_id: @regiao.inscricao_lideranca_id, ordem: @regiao.ordem } }
    end

    assert_redirected_to regiao_url(Regiao.last)
  end

  test "should show regiao" do
    get regiao_url(@regiao)
    assert_response :success
  end

  test "should get edit" do
    get edit_regiao_url(@regiao)
    assert_response :success
  end

  test "should update regiao" do
    patch regiao_url(@regiao), params: { regiao: { descricao: @regiao.descricao, inscricao_lideranca_id: @regiao.inscricao_lideranca_id, ordem: @regiao.ordem } }
    assert_redirected_to regiao_url(@regiao)
  end

  test "should destroy regiao" do
    assert_difference('Regiao.count', -1) do
      delete regiao_url(@regiao)
    end

    assert_redirected_to regiaos_url
  end
end
