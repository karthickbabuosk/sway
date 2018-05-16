class Billing::ChargebeeWrapper

	def initialize
    subscription = Account.current.subscription
    ChargeBee.configure(:site => subscription.currency_billing_site, 
                        :api_key => subscription.currency_billing_api_key)
  end

	def update_subscription(account_id, data)
		ChargeBee::Subscription.update(account_id, data)
	end

	def cancel_subscription(account_id)
		ChargeBee::Subscription.cancel(account_id)
	end

	def reactivate_subscription(account_id, data = {})
		ChargeBee::Subscription.reactivate(account_id, data)
	end

	def retrieve_subscription(account_id)
		ChargeBee::Subscription.retrieve(account_id)
	end

	#estimate
	def create_subscription_estimate(data)
		ChargeBee::Estimate.create_subscription(data)
	end

	def update_subscription_estimate(data)
		ChargeBee::Estimate.update_subscription(data)
	end


	#other
	def update_customer(account_id, data)
		ChargeBee::Customer.update(account_id, data)
	end

	def add_discount(account_id, discount_code)
		ChargeBee::Subscription.update(account_id, :coupon => discount_code)
	end

	def retrieve_plan(billing_plan_name)
		ChargeBee::Plan.retrieve(billing_plan_name)
	end

	def retrieve_coupon(coupon_code)
		ChargeBee::Coupon.retrieve(URI.encode(coupon_code))
	end
	
	def update_payment_method(account_id)
		ChargeBee::HostedPage.update_payment_method({:iframe_messaging => true, :embed => true, :customer => {:id => account_id}})
	end

	def add_credit(account_id,amount_in_cents,description = "")
		ChargeBee::Customer.add_account_credits(account_id, {:amount => amount_in_cents, :description => "#{description}"})
	end

	def deduct_credit(account_id,amount_in_cents,description = "")
		ChargeBee::Customer.deduct_account_credits(account_id, {:amount => amount_in_cents, :description => "#{description}"})
	end

	def retrieve_coupon(coupon_code)
		ChargeBee::Coupon.retrieve(coupon_code)
	end

	def set_credit(account_id,parameters={})
		ChargeBee::Customer.set_account_credits(account_id,{:amount => parameters[:amount],:description => parameters[:description]})
	end
end