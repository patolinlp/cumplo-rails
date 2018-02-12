class CreateUfs < ActiveRecord::Migration[5.1]
  def change
    create_table :ufs do |t|
      t.float :valor
      t.date :fecha

      t.timestamps
    end
  end
end
