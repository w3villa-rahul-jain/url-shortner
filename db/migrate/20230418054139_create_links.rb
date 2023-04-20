class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :lookup_code
      t.string :original_url

      t.timestamps
    end
  end
end


# class AddClickCountToUrls < ActiveRecord::Migration[6.1]
#   def change
#     add_column :urls, :click_count, :integer
#   end
# end


# class CreateUrls < ActiveRecord::Migration[6.1]
#   def change
#     create_table :urls do |t|
#       t.string :original_url
#       t.string :short_url

#       t.timestamps
#     end
#     add_index :urls, :short_url
#   end
# end 

