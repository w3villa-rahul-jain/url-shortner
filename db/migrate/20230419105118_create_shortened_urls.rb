class CreateShortenedUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :shortened_urls do |t|
      t.string :shortened_code
      t.text :long_url

      t.timestamps
    end
    add_index :shortened_urls, :shortened_code
  end
end
