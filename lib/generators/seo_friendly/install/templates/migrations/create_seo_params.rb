class SeoFriendly < ActiveRecord::Migration

  def change
    create_table :seo_params do |t|
      t.string :description
      t.string :title
      t.string :keywords

      t.integer :searchable_id
      t.string  :searchable_type

      t.timestamps null: false
    end

    add_index :seo_params, [ :searchable_id, :searchable_type ]

  end
end