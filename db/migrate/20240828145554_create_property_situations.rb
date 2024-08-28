class CreatePropertySituations < ActiveRecord::Migration[7.1]
  def change
    create_table :property_situations do |t|
      t.string :name, limit: 50

      t.timestamps
    end
  end
end
