require 'test_helper'

class InscricaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscricao = inscricaos(:one)
  end

  test "should get index" do
    get inscricaos_url
    assert_response :success
  end

  test "should get new" do
    get new_inscricao_url
    assert_response :success
  end

  test "should create inscricao" do
    assert_difference('Inscricao.count') do
      post inscricaos_url, params: { inscricao: { bairro: @inscricao.bairro, cep: @inscricao.cep, cidade: @inscricao.cidade, complemento: @inscricao.complemento, cpf: @inscricao.cpf, data_nascimento: @inscricao.data_nascimento, email: @inscricao.email, endereco: @inscricao.endereco, estado_civil: @inscricao.estado_civil, formacao: @inscricao.formacao, nacionalidade: @inscricao.nacionalidade, naturalidade: @inscricao.naturalidade, nome_completo: @inscricao.nome_completo, nome_mae: @inscricao.nome_mae, numero_registro: @inscricao.numero_registro, orgao_emissor: @inscricao.orgao_emissor, orgao_representacao_classe: @inscricao.orgao_representacao_classe, rg: @inscricao.rg, sexo: @inscricao.sexo, telefone_celular: @inscricao.telefone_celular, telefone_fixo: @inscricao.telefone_fixo, termo_aceito: @inscricao.termo_aceito, uf: @inscricao.uf } }
    end

    assert_redirected_to inscricao_url(Inscricao.last)
  end

  test "should show inscricao" do
    get inscricao_url(@inscricao)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscricao_url(@inscricao)
    assert_response :success
  end

  test "should update inscricao" do
    patch inscricao_url(@inscricao), params: { inscricao: { bairro: @inscricao.bairro, cep: @inscricao.cep, cidade: @inscricao.cidade, complemento: @inscricao.complemento, cpf: @inscricao.cpf, data_nascimento: @inscricao.data_nascimento, email: @inscricao.email, endereco: @inscricao.endereco, estado_civil: @inscricao.estado_civil, formacao: @inscricao.formacao, nacionalidade: @inscricao.nacionalidade, naturalidade: @inscricao.naturalidade, nome_completo: @inscricao.nome_completo, nome_mae: @inscricao.nome_mae, numero_registro: @inscricao.numero_registro, orgao_emissor: @inscricao.orgao_emissor, orgao_representacao_classe: @inscricao.orgao_representacao_classe, rg: @inscricao.rg, sexo: @inscricao.sexo, telefone_celular: @inscricao.telefone_celular, telefone_fixo: @inscricao.telefone_fixo, termo_aceito: @inscricao.termo_aceito, uf: @inscricao.uf } }
    assert_redirected_to inscricao_url(@inscricao)
  end

  test "should destroy inscricao" do
    assert_difference('Inscricao.count', -1) do
      delete inscricao_url(@inscricao)
    end

    assert_redirected_to inscricaos_url
  end
end
