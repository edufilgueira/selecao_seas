require "application_system_test_case"

class InscricaoServidorsTest < ApplicationSystemTestCase
  setup do
    @inscricao_servidor = inscricao_servidors(:one)
  end

  test "visiting the index" do
    visit inscricao_servidors_url
    assert_selector "h1", text: "Inscricao Servidors"
  end

  test "creating a Inscricao servidor" do
    visit inscricao_servidors_url
    click_on "New Inscricao Servidor"

    click_on "Create Inscricao servidor"

    assert_text "Inscricao servidor was successfully created"
    click_on "Back"
  end

  test "updating a Inscricao servidor" do
    visit inscricao_servidors_url
    click_on "Edit", match: :first

    click_on "Update Inscricao servidor"

    assert_text "Inscricao servidor was successfully updated"
    click_on "Back"
  end

  test "destroying a Inscricao servidor" do
    visit inscricao_servidors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inscricao servidor was successfully destroyed"
  end
end
