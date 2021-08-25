require "application_system_test_case"

class LocalContratacaosTest < ApplicationSystemTestCase
  setup do
    @local_contratacao = local_contratacaos(:one)
  end

  test "visiting the index" do
    visit local_contratacaos_url
    assert_selector "h1", text: "Local Contratacaos"
  end

  test "creating a Local contratacao" do
    visit local_contratacaos_url
    click_on "New Local Contratacao"

    fill_in "Descricao", with: @local_contratacao.descricao
    click_on "Create Local contratacao"

    assert_text "Local contratacao was successfully created"
    click_on "Back"
  end

  test "updating a Local contratacao" do
    visit local_contratacaos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @local_contratacao.descricao
    click_on "Update Local contratacao"

    assert_text "Local contratacao was successfully updated"
    click_on "Back"
  end

  test "destroying a Local contratacao" do
    visit local_contratacaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Local contratacao was successfully destroyed"
  end
end
