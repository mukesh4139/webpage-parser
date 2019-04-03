class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :_type
      t.text :content
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
