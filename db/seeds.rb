# frozen_string_literal: true

15.times do |i|
  user = User.create({ name: Faker::Name.name })
  (1..3).to_a.sample.times do |i|
    begin
      user.accounts.create({ 
        account_number: Faker::Bank.account_number, 
        balance: rand(1500..10000)
      })
    rescue ActiveRecord::RecordNotUnique => e
      # eats-up
    end 
  end
end
