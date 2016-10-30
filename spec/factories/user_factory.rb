FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "test#{n}@example.com" }
		password "password"

		trait :admin do
			admin true
		end

		trait :subscribed do
			subscribed true
		end			
	end
end