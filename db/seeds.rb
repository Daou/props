require 'ffaker'

puts '== Creating users'
20.times do
  User.create!(name: FFaker::Name.name,
               email: FFaker::Internet.email)
end

puts '== Creating props'
user_ids = User.pluck(:id)
100.times do
  user_id = user_ids.sample
  propser_id = (user_ids - [user_id]).sample
  body = if [true, false].sample
           FFaker::HipsterIpsum.sentence
         else
           FFaker::HipsterIpsum.paragraph[0..250]
         end
  date = Random.rand(60.days.to_i).seconds.ago
  prop = Prop.new(propser_id: propser_id,
                  body: body,
                  created_at: date,
                  updated_at: date)
  prop.prop_receivers.build(user_id: user_id)
  prop.save
end

puts '== Creating upvotes'
prop_ids = Prop.pluck(:id)
100.times do
  user_id = user_ids.sample
  prop_id = prop_ids.sample
  Upvote.create(prop_id: prop_id, user_id: user_id)
end
puts '== DONE!'
