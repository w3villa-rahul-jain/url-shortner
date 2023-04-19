class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.string :shortlink
      t.integer :ncount
      t.references :url, foreign_key: true

      t.timestamps
    end
  end
end
