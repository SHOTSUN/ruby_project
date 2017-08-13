class CreateProjs < ActiveRecord::Migration
  def change
    create_table :projs do |t|
      t.string :title
      t.string :string
      t.text :content

      t.timestamps null: false
    end
  end
end
