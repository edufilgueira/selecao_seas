class AddCargoToInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    add_reference :inscricao_liderancas, :cargo, foreign_key: true
  end
end
