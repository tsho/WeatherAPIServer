class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.string :prefecture
      t.string :prediction
      t.datetime :date

      t.timestamps null: false
    end
  end
end
