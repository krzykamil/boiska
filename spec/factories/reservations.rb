FactoryBot.define do
  factory :reservation do
    time_from { '2019-01-16 13:58:56' }
    time_to { '2019-01-16 15:58:56' }
    time { 'MyString' }
    user { nil }
    court { nil }
    school_reservation { false }
  end
end
