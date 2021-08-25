class AddLocalContratacaoToRegiaos < ActiveRecord::Migration[5.2]
  def change
    add_reference :regiaos, :local_contratacao, foreign_key: true
  end
end
