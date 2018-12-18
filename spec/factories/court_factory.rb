#encoding: utf-8
FactoryBot.define do
  factory :court do
    district { 'Jaroszówka' }
    area { '12m2' }
    subsoil_type { 'grass' }
    sequence(:school) {|n| "SP #{n}"}
  end
end
