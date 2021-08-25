require "application_system_test_case"

class InscricaoLiderancasTest < ApplicationSystemTestCase
  setup do
    @inscricao_lideranca = inscricao_liderancas(:one)
  end

  test "visiting the index" do
    visit inscricao_liderancas_url
    assert_selector "h1", text: "Inscricao Liderancas"
  end

  test "creating a Inscricao lideranca" do
    visit inscricao_liderancas_url
    click_on "New Inscricao Lideranca"

    fill_in "Bairro", with: @inscricao_lideranca.bairro
    fill_in "Cep", with: @inscricao_lideranca.cep
    fill_in "Cidade", with: @inscricao_lideranca.cidade
    fill_in "Complemento", with: @inscricao_lideranca.complemento
    check "Correcao" if @inscricao_lideranca.correcao
    check "Cota negro" if @inscricao_lideranca.cota_negro
    fill_in "Cpf", with: @inscricao_lideranca.cpf
    fill_in "Data nascimento", with: @inscricao_lideranca.data_nascimento
    check "Deficiente" if @inscricao_lideranca.deficiente
    fill_in "Deficiente anexo", with: @inscricao_lideranca.deficiente_anexo
    fill_in "Documentos", with: @inscricao_lideranca.documentos
    fill_in "Email", with: @inscricao_lideranca.email
    fill_in "Endereco", with: @inscricao_lideranca.endereco
    fill_in "Estado civil", with: @inscricao_lideranca.estado_civil
    check "Finalizar" if @inscricao_lideranca.finalizar
    fill_in "Nacionalidade", with: @inscricao_lideranca.nacionalidade
    fill_in "Naturalidade", with: @inscricao_lideranca.naturalidade
    fill_in "Nome completo", with: @inscricao_lideranca.nome_completo
    fill_in "Nome mae", with: @inscricao_lideranca.nome_mae
    fill_in "Numero registro", with: @inscricao_lideranca.numero_registro
    fill_in "Observacao", with: @inscricao_lideranca.observacao
    fill_in "Orgao emissor", with: @inscricao_lideranca.orgao_emissor
    fill_in "Orgao representacao classe", with: @inscricao_lideranca.orgao_representacao_classe
    check "Pessoa com deficiencia" if @inscricao_lideranca.pessoa_com_deficiencia
    check "Reclassificar recurso candidato dados" if @inscricao_lideranca.reclassificar_recurso_candidato_dados
    check "Reclassificar recurso entrevista" if @inscricao_lideranca.reclassificar_recurso_entrevista
    fill_in "Recurso", with: @inscricao_lideranca.recurso
    fill_in "Recurso candidato dados", with: @inscricao_lideranca.recurso_candidato_dados
    fill_in "Recurso entrevista", with: @inscricao_lideranca.recurso_entrevista
    check "Recurso solicitado" if @inscricao_lideranca.recurso_solicitado
    fill_in "Represetacao classe", with: @inscricao_lideranca.represetacao_classe
    fill_in "Resposta recurso candidato dados", with: @inscricao_lideranca.resposta_recurso_candidato_dados
    fill_in "Resposta recurso entrevista", with: @inscricao_lideranca.resposta_recurso_entrevista
    fill_in "Rg", with: @inscricao_lideranca.rg
    fill_in "Sexo", with: @inscricao_lideranca.sexo
    fill_in "Slug", with: @inscricao_lideranca.slug
    fill_in "Status acompanhamento", with: @inscricao_lideranca.status_acompanhamento
    fill_in "Telefone celular", with: @inscricao_lideranca.telefone_celular
    fill_in "Telefone fixo", with: @inscricao_lideranca.telefone_fixo
    check "Termo aceito" if @inscricao_lideranca.termo_aceito
    fill_in "Uf", with: @inscricao_lideranca.uf
    fill_in "Usuario corrigiu dados", with: @inscricao_lideranca.usuario_corrigiu_dados
    click_on "Create Inscricao lideranca"

    assert_text "Inscricao lideranca was successfully created"
    click_on "Back"
  end

  test "updating a Inscricao lideranca" do
    visit inscricao_liderancas_url
    click_on "Edit", match: :first

    fill_in "Bairro", with: @inscricao_lideranca.bairro
    fill_in "Cep", with: @inscricao_lideranca.cep
    fill_in "Cidade", with: @inscricao_lideranca.cidade
    fill_in "Complemento", with: @inscricao_lideranca.complemento
    check "Correcao" if @inscricao_lideranca.correcao
    check "Cota negro" if @inscricao_lideranca.cota_negro
    fill_in "Cpf", with: @inscricao_lideranca.cpf
    fill_in "Data nascimento", with: @inscricao_lideranca.data_nascimento
    check "Deficiente" if @inscricao_lideranca.deficiente
    fill_in "Deficiente anexo", with: @inscricao_lideranca.deficiente_anexo
    fill_in "Documentos", with: @inscricao_lideranca.documentos
    fill_in "Email", with: @inscricao_lideranca.email
    fill_in "Endereco", with: @inscricao_lideranca.endereco
    fill_in "Estado civil", with: @inscricao_lideranca.estado_civil
    check "Finalizar" if @inscricao_lideranca.finalizar
    fill_in "Nacionalidade", with: @inscricao_lideranca.nacionalidade
    fill_in "Naturalidade", with: @inscricao_lideranca.naturalidade
    fill_in "Nome completo", with: @inscricao_lideranca.nome_completo
    fill_in "Nome mae", with: @inscricao_lideranca.nome_mae
    fill_in "Numero registro", with: @inscricao_lideranca.numero_registro
    fill_in "Observacao", with: @inscricao_lideranca.observacao
    fill_in "Orgao emissor", with: @inscricao_lideranca.orgao_emissor
    fill_in "Orgao representacao classe", with: @inscricao_lideranca.orgao_representacao_classe
    check "Pessoa com deficiencia" if @inscricao_lideranca.pessoa_com_deficiencia
    check "Reclassificar recurso candidato dados" if @inscricao_lideranca.reclassificar_recurso_candidato_dados
    check "Reclassificar recurso entrevista" if @inscricao_lideranca.reclassificar_recurso_entrevista
    fill_in "Recurso", with: @inscricao_lideranca.recurso
    fill_in "Recurso candidato dados", with: @inscricao_lideranca.recurso_candidato_dados
    fill_in "Recurso entrevista", with: @inscricao_lideranca.recurso_entrevista
    check "Recurso solicitado" if @inscricao_lideranca.recurso_solicitado
    fill_in "Represetacao classe", with: @inscricao_lideranca.represetacao_classe
    fill_in "Resposta recurso candidato dados", with: @inscricao_lideranca.resposta_recurso_candidato_dados
    fill_in "Resposta recurso entrevista", with: @inscricao_lideranca.resposta_recurso_entrevista
    fill_in "Rg", with: @inscricao_lideranca.rg
    fill_in "Sexo", with: @inscricao_lideranca.sexo
    fill_in "Slug", with: @inscricao_lideranca.slug
    fill_in "Status acompanhamento", with: @inscricao_lideranca.status_acompanhamento
    fill_in "Telefone celular", with: @inscricao_lideranca.telefone_celular
    fill_in "Telefone fixo", with: @inscricao_lideranca.telefone_fixo
    check "Termo aceito" if @inscricao_lideranca.termo_aceito
    fill_in "Uf", with: @inscricao_lideranca.uf
    fill_in "Usuario corrigiu dados", with: @inscricao_lideranca.usuario_corrigiu_dados
    click_on "Update Inscricao lideranca"

    assert_text "Inscricao lideranca was successfully updated"
    click_on "Back"
  end

  test "destroying a Inscricao lideranca" do
    visit inscricao_liderancas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inscricao lideranca was successfully destroyed"
  end
end
