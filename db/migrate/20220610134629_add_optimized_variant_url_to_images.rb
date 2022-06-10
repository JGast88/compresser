class AddOptimizedVariantUrlToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :optimized_variant_url, :string
  end
end
