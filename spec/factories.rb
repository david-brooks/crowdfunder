FactoryGirl.define do
	factory :user do
		first_name "Jimbo"
		last_name "Baggins"
		email "donthate@gmail.com"
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
		user
	end
end

