class CreateAccounts < ActiveRecord::Migration
  def up
  	create_table :accounts do |t|  
      t.integer     :account_id,  :limit => 8
      t.string     :account_name
      t.string		:status
      t.timestamps
    end
  end

  def down
  	drop_table :accounts
  end
end

