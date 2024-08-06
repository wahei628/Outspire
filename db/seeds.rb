DiagnosisQuestion.create!([
  { question_text: "1.アクティブな活動に興味はありますか？", points:      { "result1" => 3, "result8" => 2, "result7" => 1 } },
  { question_text: "2.人混みは気になりますか？", points:                { "result3" => 3, "result4" => 2, "result6" => 1 } },
  { question_text: "3.自然の中で過ごすのは好きですか？", points:         { "result1" => 3, "result7" => 2, "result2" => 1 } },
  { question_text: "4.体力に自信はありますか？", points:                { "result1" => 3, "result8" => 2, "result7" => 1 } },
  { question_text: "5.新しいことに挑戦するのは好きですか？", points:      { "result6" => 3, "result7" => 2, "result4" => 1 } },
  { question_text: "6.文化的な場所に行くのは好きですか？", points:        { "result4" => 3, "result6" => 2, "result2" => 1 } },
  { question_text: "7.買い物をするのは好きですか？", points:             { "result6" => 3, "result2" => 2, "result4" => 1 } },
  { question_text: "8.のんびりとした時間を過ごすのは好きですか？", points: { "result3" => 3, "result5" => 2, "result6" => 1 } },
  { question_text: "9.ストレス発散したい気分ですか？", points:           { "result8" => 3, "result5" => 2, "result1" => 1 } },
  { question_text: "10.食べることは好きですか？", points:               { "result5" => 3, "result2" => 2, "result3" => 1 } },
  { question_text: "11.動物は好きですか？", points:                    { "result7" => 3, "result4" => 2, "result8" => 1 } },
  { question_text: "12.一人で過ごす時間は好きですか？", points:          { "result3" => 3, "result4" => 2, "result6" => 1 } }
])

DiagnosisResult.create!([
  { result_text: "近くの公園でランニングを楽しむのはどうかな！ストレス解消しよう！", key: "result1" },
  { result_text: "カフェでゆったりとした休日を過ごそうか！インスタ映えする写真をあげよう！", key: "result2" },
  { result_text: "今日は家でゆっくりしたほうがいいみたい！たまにはいいよね！", key: "result3" },
  { result_text: "映画を見て感性深めよう！感想知りたいな！", key: "result4" },
  { result_text: "居酒屋やバーで飲もうか！昼飲みサイコー！", key: "result5" },
  { result_text: "今日は本を読んでみよう！図書館や本屋さんへGoGo！", key: "result6" },
  { result_text: "動物園や水族館に行こうか！イルカのショーやってないかな！", key: "result7" },
  { result_text: "ショッピングモールに行って買い物しようか！爆買い注意！", key: "result8" }
])
