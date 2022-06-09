class AddFormatToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :image_format, :string
  end
end
