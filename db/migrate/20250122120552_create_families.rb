class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
