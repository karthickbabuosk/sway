class Setting < ActiveRecord::Base
  attr_accessible :user_id, :api_key, :site
end
