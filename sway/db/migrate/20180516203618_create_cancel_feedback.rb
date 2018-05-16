class CreateCancelFeedback < ActiveRecord::Migration
  def up
  	create_table :cancel_feedback do |t|  
      t.integer		:detour_form_id, :limit => 8
      t.integer		:account_id, :limit => 8
      t.text     	:feedback
      t.timestamps
    end
  end

  def down
  	drop_table :detour_form
  end
end
