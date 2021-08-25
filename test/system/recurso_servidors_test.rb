require "application_system_test_case"

class RecursoServidorsTest < ApplicationSystemTestCase
  setup do
    @recurso_servidor = recurso_servidors(:one)
  end

  test "visiting the index" do
    visit recurso_servidors_url
    assert_selector "h1", text: "Recurso Servidors"
  end

  test "creating a Recurso servidor" do
    visit recurso_servidors_url
    click_on "New Recurso Servidor"

    fill_in "Inscricao servidor", with: @recurso_servidor.inscricao_servidor_id
    fill_in "Texto", with: @recurso_servidor.texto
    click_on "Create Recurso servidor"

    assert_text "Recurso servidor was successfully created"
    click_on "Back"
  end

  test "updating a Recurso servidor" do
    visit recurso_servidors_url
    click_on "Edit", match: :first

    fill_in "Inscricao servidor", with: @recurso_servidor.inscricao_servidor_id
    fill_in "Texto", with: @recurso_servidor.texto
    click_on "Update Recurso servidor"

    assert_text "Recurso servidor was successfully updated"
    click_on "Back"
  end

  test "destroying a Recurso servidor" do
    visit recurso_servidors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recurso servidor was successfully destroyed"
  end
end
