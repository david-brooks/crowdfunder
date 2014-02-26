FactoryGirl.define do
	factory :user, aliases: [:owner] do
		first_name "Jimbo"
		last_name "Baggins"
		sequence(:email, 1000) { |n| "person#{n}@example.com" }
		password "baggins"
		password_confirmation "baggins"
	end
end


FactoryGirl.define do
	factory :project do
		title "This is dope"
		description "Fund my project meng!"
		goal 5678
		start_date Time.now
		end_date 5.days.from_now
		owner
	end
end

FactoryGirl.define do
	factory :reward do
		amount 45
		description "Fund my project meng!"
		project
	end
end

