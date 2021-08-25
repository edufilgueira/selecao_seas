require "application_system_test_case"

class ConfiguracaosTest < ApplicationSystemTestCase
  setup do
    @configuracao = configuracaos(:one)
  end

  test "visiting the index" do
    visit configuracaos_url
    assert_selector "h1", text: "Configuracaos"
  end

  test "creating a Configuracao" do
    visit configuracaos_url
    click_on "New Configuracao"

    fill_in "Data termino selecao", with: @configuracao.data_termino_selecao
    check "Status" if @configuracao.status
    click_on "Create Configuracao"

    assert_text "Configuracao was successfully created"
    click_on "Back"
  end

  test "updating a Configuracao" do
    visit configuracaos_url
    click_on "Edit", match: :first

    fill_in "Data termino selecao", with: @configuracao.data_termino_selecao
    check "Status" if @configuracao.status
    click_on "Update Configuracao"

    assert_text "Configuracao was successfully updated"
    click_on "Back"
  end

  test "destroying a Configuracao" do
    visit configuracaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Configuracao was successfully destroyed"
  end
end
