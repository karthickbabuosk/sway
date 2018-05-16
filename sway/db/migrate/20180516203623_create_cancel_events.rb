class CreateCancelEvents < ActiveRecord::Migration
   def up
  	create_table :cancel_events do |t|  
      t.integer		:account_id, :limit => 8
      t.integer		:events
      t.timestamps
    end
  end

  def down
  	drop_table :cancel_events
  end
end
