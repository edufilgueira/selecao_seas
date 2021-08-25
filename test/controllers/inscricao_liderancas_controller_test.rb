require 'test_helper'

class InscricaoLiderancasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inscricao_lideranca = inscricao_liderancas(:one)
  end

  test "should get index" do
    get inscricao_liderancas_url
    assert_response :success
  end

  test "should get new" do
    get new_inscricao_lideranca_url
    assert_response :success
  end

  test "should create inscricao_lideranca" do
    assert_difference('InscricaoLideranca.count') do
      post inscricao_liderancas_url, params: { inscricao_lideranca: { bairro: @inscricao_lideranca.bairro, cep: @inscricao_lideranca.cep, cidade: @inscricao_lideranca.cidade, complemento: @inscricao_lideranca.complemento, correcao: @inscricao_lideranca.correcao, cota_negro: @inscricao_lideranca.cota_negro, cpf: @inscricao_lideranca.cpf, data_nascimento: @inscricao_lideranca.data_nascimento, deficiente: @inscricao_lideranca.deficiente, deficiente_anexo: @inscricao_lideranca.deficiente_anexo, documentos: @inscricao_lideranca.documentos, email: @inscricao_lideranca.email, endereco: @inscricao_lideranca.endereco, estado_civil: @inscricao_lideranca.estado_civil, finalizar: @inscricao_lideranca.finalizar, nacionalidade: @inscricao_lideranca.nacionalidade, naturalidade: @inscricao_lideranca.naturalidade, nome_completo: @inscricao_lideranca.nome_completo, nome_mae: @inscricao_lideranca.nome_mae, numero_registro: @inscricao_lideranca.numero_registro, observacao: @inscricao_lideranca.observacao, orgao_emissor: @inscricao_lideranca.orgao_emissor, orgao_representacao_classe: @inscricao_lideranca.orgao_representacao_classe, pessoa_com_deficiencia: @inscricao_lideranca.pessoa_com_deficiencia, reclassificar_recurso_candidato_dados: @inscricao_lideranca.reclassificar_recurso_candidato_dados, reclassificar_recurso_entrevista: @inscricao_lideranca.reclassificar_recurso_entrevista, recurso: @inscricao_lideranca.recurso, recurso_candidato_dados: @inscricao_lideranca.recurso_candidato_dados, recurso_entrevista: @inscricao_lideranca.recurso_entrevista, recurso_solicitado: @inscricao_lideranca.recurso_solicitado, represetacao_classe: @inscricao_lideranca.represetacao_classe, resposta_recurso_candidato_dados: @inscricao_lideranca.resposta_recurso_candidato_dados, resposta_recurso_entrevista: @inscricao_lideranca.resposta_recurso_entrevista, rg: @inscricao_lideranca.rg, sexo: @inscricao_lideranca.sexo, slug: @inscricao_lideranca.slug, status_acompanhamento: @inscricao_lideranca.status_acompanhamento, telefone_celular: @inscricao_lideranca.telefone_celular, telefone_fixo: @inscricao_lideranca.telefone_fixo, termo_aceito: @inscricao_lideranca.termo_aceito, uf: @inscricao_lideranca.uf, usuario_corrigiu_dados: @inscricao_lideranca.usuario_corrigiu_dados } }
    end

    assert_redirected_to inscricao_lideranca_url(InscricaoLideranca.last)
  end

  test "should show inscricao_lideranca" do
    get inscricao_lideranca_url(@inscricao_lideranca)
    assert_response :success
  end

  test "should get edit" do
    get edit_inscricao_lideranca_url(@inscricao_lideranca)
    assert_response :success
  end

  test "should update inscricao_lideranca" do
    patch inscricao_lideranca_url(@inscricao_lideranca), params: { inscricao_lideranca: { bairro: @inscricao_lideranca.bairro, cep: @inscricao_lideranca.cep, cidade: @inscricao_lideranca.cidade, complemento: @inscricao_lideranca.complemento, correcao: @inscricao_lideranca.correcao, cota_negro: @inscricao_lideranca.cota_negro, cpf: @inscricao_lideranca.cpf, data_nascimento: @inscricao_lideranca.data_nascimento, deficiente: @inscricao_lideranca.deficiente, deficiente_anexo: @inscricao_lideranca.deficiente_anexo, documentos: @inscricao_lideranca.documentos, email: @inscricao_lideranca.email, endereco: @inscricao_lideranca.endereco, estado_civil: @inscricao_lideranca.estado_civil, finalizar: @inscricao_lideranca.finalizar, nacionalidade: @inscricao_lideranca.nacionalidade, naturalidade: @inscricao_lideranca.naturalidade, nome_completo: @inscricao_lideranca.nome_completo, nome_mae: @inscricao_lideranca.nome_mae, numero_registro: @inscricao_lideranca.numero_registro, observacao: @inscricao_lideranca.observacao, orgao_emissor: @inscricao_lideranca.orgao_emissor, orgao_representacao_classe: @inscricao_lideranca.orgao_representacao_classe, pessoa_com_deficiencia: @inscricao_lideranca.pessoa_com_deficiencia, reclassificar_recurso_candidato_dados: @inscricao_lideranca.reclassificar_recurso_candidato_dados, reclassificar_recurso_entrevista: @inscricao_lideranca.reclassificar_recurso_entrevista, recurso: @inscricao_lideranca.recurso, recurso_candidato_dados: @inscricao_lideranca.recurso_candidato_dados, recurso_entrevista: @inscricao_lideranca.recurso_entrevista, recurso_solicitado: @inscricao_lideranca.recurso_solicitado, represetacao_classe: @inscricao_lideranca.represetacao_classe, resposta_recurso_candidato_dados: @inscricao_lideranca.resposta_recurso_candidato_dados, resposta_recurso_entrevista: @inscricao_lideranca.resposta_recurso_entrevista, rg: @inscricao_lideranca.rg, sexo: @inscricao_lideranca.sexo, slug: @inscricao_lideranca.slug, status_acompanhamento: @inscricao_lideranca.status_acompanhamento, telefone_celular: @inscricao_lideranca.telefone_celular, telefone_fixo: @inscricao_lideranca.telefone_fixo, termo_aceito: @inscricao_lideranca.termo_aceito, uf: @inscricao_lideranca.uf, usuario_corrigiu_dados: @inscricao_lideranca.usuario_corrigiu_dados } }
    assert_redirected_to inscricao_lideranca_url(@inscricao_lideranca)
  end

  test "should destroy inscricao_lideranca" do
    assert_difference('InscricaoLideranca.count', -1) do
      delete inscricao_lideranca_url(@inscricao_lideranca)
    end

    assert_redirected_to inscricao_liderancas_url
  end
end
