class CreateFamilies < ActiveRecord::Migration[8.0]
  def change
    create_table :families do |t|
      t.string :family_name

      t.timestamps
    end
  end
end
