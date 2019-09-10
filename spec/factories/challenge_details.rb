FactoryBot.define do
  factory :challenge_detail do
    challenge_id { 1 }
    frame_num { 0 }
    url { "http://sample.com" }
    comment { "AAAAAA" }
    date {"2019/04/29"}
  end
end
