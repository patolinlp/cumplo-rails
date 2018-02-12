class CreateDolars < ActiveRecord::Migration[5.1]
  def change
    create_table :dolars do |t|
      t.float :valor
      t.date :fecha

      t.timestamps
    end
  end
end
