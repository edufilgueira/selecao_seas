require "application_system_test_case"

class InscricaosTest < ApplicationSystemTestCase
  setup do
    @inscricao = inscricaos(:one)
  end

  test "visiting the index" do
    visit inscricaos_url
    assert_selector "h1", text: "Inscricaos"
  end

  test "creating a Inscricao" do
    visit inscricaos_url
    click_on "New Inscricao"

    fill_in "Bairro", with: @inscricao.bairro
    fill_in "Cep", with: @inscricao.cep
    fill_in "Cidade", with: @inscricao.cidade
    fill_in "Complemento", with: @inscricao.complemento
    fill_in "Cpf", with: @inscricao.cpf
    fill_in "Data nascimento", with: @inscricao.data_nascimento
    fill_in "Email", with: @inscricao.email
    fill_in "Endereco", with: @inscricao.endereco
    fill_in "Estado civil", with: @inscricao.estado_civil
    fill_in "Formacao", with: @inscricao.formacao
    fill_in "Nacionalidade", with: @inscricao.nacionalidade
    fill_in "Naturalidade", with: @inscricao.naturalidade
    fill_in "Nome completo", with: @inscricao.nome_completo
    fill_in "Nome mae", with: @inscricao.nome_mae
    fill_in "Numero registro", with: @inscricao.numero_registro
    fill_in "Orgao emissor", with: @inscricao.orgao_emissor
    fill_in "Orgao representacao classe", with: @inscricao.orgao_representacao_classe
    fill_in "Rg", with: @inscricao.rg
    fill_in "Sexo", with: @inscricao.sexo
    fill_in "Telefone celular", with: @inscricao.telefone_celular
    fill_in "Telefone fixo", with: @inscricao.telefone_fixo
    check "Termo aceito" if @inscricao.termo_aceito
    fill_in "Uf", with: @inscricao.uf
    click_on "Create Inscricao"

    assert_text "Inscricao was successfully created"
    click_on "Back"
  end

  test "updating a Inscricao" do
    visit inscricaos_url
    click_on "Edit", match: :first

    fill_in "Bairro", with: @inscricao.bairro
    fill_in "Cep", with: @inscricao.cep
    fill_in "Cidade", with: @inscricao.cidade
    fill_in "Complemento", with: @inscricao.complemento
    fill_in "Cpf", with: @inscricao.cpf
    fill_in "Data nascimento", with: @inscricao.data_nascimento
    fill_in "Email", with: @inscricao.email
    fill_in "Endereco", with: @inscricao.endereco
    fill_in "Estado civil", with: @inscricao.estado_civil
    fill_in "Formacao", with: @inscricao.formacao
    fill_in "Nacionalidade", with: @inscricao.nacionalidade
    fill_in "Naturalidade", with: @inscricao.naturalidade
    fill_in "Nome completo", with: @inscricao.nome_completo
    fill_in "Nome mae", with: @inscricao.nome_mae
    fill_in "Numero registro", with: @inscricao.numero_registro
    fill_in "Orgao emissor", with: @inscricao.orgao_emissor
    fill_in "Orgao representacao classe", with: @inscricao.orgao_representacao_classe
    fill_in "Rg", with: @inscricao.rg
    fill_in "Sexo", with: @inscricao.sexo
    fill_in "Telefone celular", with: @inscricao.telefone_celular
    fill_in "Telefone fixo", with: @inscricao.telefone_fixo
    check "Termo aceito" if @inscricao.termo_aceito
    fill_in "Uf", with: @inscricao.uf
    click_on "Update Inscricao"

    assert_text "Inscricao was successfully updated"
    click_on "Back"
  end

  test "destroying a Inscricao" do
    visit inscricaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inscricao was successfully destroyed"
  end
end
