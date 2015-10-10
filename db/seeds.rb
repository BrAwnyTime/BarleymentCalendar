# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brad = User.new email: "bradaune@gmail.com", password: "testtest", password_confirmation: "testtest"
brad.skip_confirmation!
brad.save
dan = User.new email: "dancmorton@gmail.com", password: "testtest", password_confirmation: "testtest"
dan.skip_confirmation!
dan.save

def round_to_half_hour(time)
	if time.min >= 45
		time += (60 - time.min).minutes
	elsif time.min >= 15
		time += (30 - time.min).minutes
	else
		time -= (time.min).minutes
	end
	return time
end

20.times do
	start = round_to_half_hour(Faker::Time.between(1.month.ago, 1.month.from_now).at_beginning_of_minute)
	duration = ((rand(16) + 1) * 30).minutes

	Event.create(
			title: Faker::Hacker.noun,
			description: Faker::Lorem.paragraph,
			all_day: false,
			start_datetime: start,
			end_datetime: start + duration,
      user: brad
		)
end

5.times do
	Event.create(
			title: Faker::Hacker.noun,
			description: Faker::Lorem.paragraph,
			all_day: true,
			start_datetime: round_to_half_hour(Faker::Time.between(1.month.ago, 1.month.from_now).at_beginning_of_minute),
      user: brad
		)
end
