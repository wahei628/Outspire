DiagnosisQuestion.create([
  { question_text: "アクティブな活動に興味はありますか？", category_id: 1, weight: 2 },
  { question_text: "人混みは気になりますか？", category_id: 2, weight: 1 },
  { question_text: "自然の中で過ごすのは好きですか？", category_id: 3, weight: 2 },
  { question_text: "体力に自信はありますか？", category_id: 4, weight: 2 },
  { question_text: "新しいことに挑戦するのは好きですか？", category_id: 5, weight: 2 },
  { question_text: "文化的な場所に行くのは好きですか？", category_id: 6, weight: 1 },
])

DiagnosisResult.create([
  { diagnosis_question_id: 1, result_text: "近くの公園でサイクリングやランニングを楽しむのはどうかな！", category_id: 1 },
  { diagnosis_question_id: 2, result_text: "地元の図書館で読書を楽しんだり、カフェでリラックスしたりするのもおすすめ！", category_id: 2 },
  { diagnosis_question_id: 3, result_text: "バスケをしてみよう！", category_id: 3 },
  { diagnosis_question_id: 4, result_text: "今日は家でゆっくりしたほうがいいみたい！", category_id: 4 },
  { diagnosis_question_id: 5, result_text: "ボーリングでストレス発散しよう！", category_id: 5 },
  { diagnosis_question_id: 6, result_text: "新しいことに挑戦してみよう！近くにスケボーができる場所があるみたい！", category_id: 6 },
])