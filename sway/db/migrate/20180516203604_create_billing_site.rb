class CreateBillingSite < ActiveRecord::Migration
   def up
  	create_table :billing_site do |t|  
      t.string     :site
      t.string     :api_key
      t.integer		:user_id, :limit => 8
      t.timestamps
    end
  end

  def down
  	drop_table :billing_site
  end
end
