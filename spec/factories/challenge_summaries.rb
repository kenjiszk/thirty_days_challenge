FactoryBot.define do
  factory :challenge_summary do
    challenge_id { 1 }
    s3_key { "http://sample.com" }
  end
end
