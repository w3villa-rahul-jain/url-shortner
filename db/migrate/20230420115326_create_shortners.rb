class CreateShortners < ActiveRecord::Migration[6.1]
  def change
    create_table :shortners do |t|
      t.string :original_url
      t.string :short_url
      t.integer :click_count

      t.timestamps
    end
  end
end
