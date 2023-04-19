class AddClickCountToUrls < ActiveRecord::Migration[6.1]
  def change
    add_column :urls, :click_count, :integer
  end
end
