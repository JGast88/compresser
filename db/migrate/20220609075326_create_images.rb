class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :uuid, unique: true

      t.timestamps
    end
  end
end
