FactoryBot.define do
  factory :challenge_detail do
    challenge_id { 1 }
    frame_num { 0 }
    s3_key { "http://sample.com" }
    date {"2019/04/29"}
  end
end
