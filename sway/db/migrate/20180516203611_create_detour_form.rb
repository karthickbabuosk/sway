class CreateDetourForm < ActiveRecord::Migration
  def up
  	create_table :detour_form do |t|  
      t.integer		:user_id, :limit => 8
      t.text     	:form_data
      t.timestamps
    end
  end

  def down
  	drop_table :detour_form
  end
end
