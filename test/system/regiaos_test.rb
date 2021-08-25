require "application_system_test_case"

class RegiaosTest < ApplicationSystemTestCase
  setup do
    @regiao = regiaos(:one)
  end

  test "visiting the index" do
    visit regiaos_url
    assert_selector "h1", text: "Regiaos"
  end

  test "creating a Regiao" do
    visit regiaos_url
    click_on "New Regiao"

    fill_in "Descricao", with: @regiao.descricao
    fill_in "Inscricao lideranca", with: @regiao.inscricao_lideranca_id
    fill_in "Ordem", with: @regiao.ordem
    click_on "Create Regiao"

    assert_text "Regiao was successfully created"
    click_on "Back"
  end

  test "updating a Regiao" do
    visit regiaos_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @regiao.descricao
    fill_in "Inscricao lideranca", with: @regiao.inscricao_lideranca_id
    fill_in "Ordem", with: @regiao.ordem
    click_on "Update Regiao"

    assert_text "Regiao was successfully updated"
    click_on "Back"
  end

  test "destroying a Regiao" do
    visit regiaos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Regiao was successfully destroyed"
  end
end
