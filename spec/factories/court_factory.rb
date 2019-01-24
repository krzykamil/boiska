FactoryBot.define do
  factory :court do
    district { 'Jaroszówka' }
    width { 80 }
    length { 120 }
    subsoil_type { 'grass' }
    sequence(:school) { |n| "SP #{n}" }
    administrator { create(:user) }
    supervisor { create(:user) }
  end
end
