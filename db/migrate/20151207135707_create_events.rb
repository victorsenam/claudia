class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.datetime :date
      t.text :image_url
      t.text :description

      t.timestamps null: false
    end
  end
end
