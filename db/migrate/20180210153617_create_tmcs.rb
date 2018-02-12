class CreateTmcs < ActiveRecord::Migration[5.1]
  def change
    create_table :tmcs do |t|
      t.float :valor
      t.date :fecha
      t.text :titulo
      t.text :subtitulo
      t.integer :tipo

      t.timestamps
    end
  end
end
