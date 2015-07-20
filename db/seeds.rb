# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

_1ch =  Channel.create(name: 'NHK総合',      code: '1ch').id
_2ch =  Channel.create(name: 'Eテレ',        code: '2ch').id
_4ch =  Channel.create(name: '日本テレビ',   code: '4ch').id
_5ch =  Channel.create(name: 'テレビ朝日',   code: '5ch').id
_6ch =  Channel.create(name: 'TBSテレビ',    code: '6ch').id
_7ch =  Channel.create(name: 'テレビ東京',   code: '7ch').id
_8ch =  Channel.create(name: 'フジテレビ',   code: '8ch').id
_9ch =  Channel.create(name: 'TOKYO MX',     code: '9ch').id
_3ch =  Channel.create(name: 'テレ玉',       code: '10ch').id
_BS3 =  Channel.create(name: 'BSプレミアム', code: 'BS3').id
_BS8 =  Channel.create(name: 'BSフジ',       code: 'BS8').id
_BS11 = Channel.create(name: 'BS11',         code: 'BS11').id

月 = DayOfWeek.create(name: '月', code: 'mon').id
火 = DayOfWeek.create(name: '火', code: 'tue').id
水 = DayOfWeek.create(name: '水', code: 'wed').id
木 = DayOfWeek.create(name: '木', code: 'thu').id
金 = DayOfWeek.create(name: '金', code: 'fri').id
土 = DayOfWeek.create(name: '土', code: 'sat').id
日 = DayOfWeek.create(name: '日', code: 'sun').id

Lineup.create([
  { title: '干物妹！うまるちゃん', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 月 },
  { title: '赤髪の白雪姫', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: '実は私は', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: 'のんのんびより りぴーと', start_time: '02:00:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: 'それが声優！', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: '銀魂', start_time: '18:00:00', channel_id: _7ch,  day_of_week_id: 水 },
  { title: '立花の勇者', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 水 },
  { title: 'オーバーロード', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: '空戦魔導士候補生の教官', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: '俺物語!!', start_time: '02:30:00', channel_id: _4ch,  day_of_week_id: 木 },
  { title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'がっこうぐらし！', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'アクエリオンロゴス', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: '乱歩奇譚 Game of Laplace', start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金 },
  { title: '城下町のダンデライオン', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: 'うしおととら', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'GATE 自衛隊 彼の地にて、斯く戦えり', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '監獄学園', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'Classroom☆Crisis', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: '食戟のソーマ', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: '境界のRINNE', start_time: '17:30:00', channel_id: _2ch,  day_of_week_id: 土 },
  { title: '電波教師', start_time: '17:30:00', channel_id: _4ch,  day_of_week_id: 土 },
  { title: 'デュラララ!!x2転', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'Charlotte', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'WORKING!!!', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: '下ネタという概念が存在しない退屈な世界', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'ガッチャマン クラウズ インサイト', start_time: '02:00:00', channel_id: _4ch,  day_of_week_id: 日 },
  { title: 'ワールドトリガー', start_time: '06:30:00', channel_id: _5ch,  day_of_week_id: 日 },
  { title: 'ドラゴンボール超', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'アルスラーン戦記', start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日 },
  { title: 'GOD EATER', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'GANGSTA', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日 }
])
