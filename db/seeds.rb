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
  { title: 'ハロー!!きんいろモザイク', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: '響け!ユーフォニアム', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 水 },
  { title: '銀魂', start_time: '18:00:00', channel_id: _7ch,  day_of_week_id: 水 },
  { title: 'ミカグラ学園組曲', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: '俺物語!!', start_time: '02:30:00', channel_id: _4ch,  day_of_week_id: 木 },
  { title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'えとたま', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'パンチライン', start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金 },
  { title: 'やはり俺の青春ラブコメはまちがっている続', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: 'レーカン!', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: 'ニセコイ:', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'ジョジョの奇妙な冒険III', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'ダンジョンに出合いを求めるのは間違っているだろうか', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'シドニアの騎士 第九惑星戦役', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: '食戟のソーマ', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: '暗殺教室', start_time: '10:00:00', channel_id: _BS8,  day_of_week_id: 土 },
  { title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: '境界のRINNE', start_time: '17:30:00', channel_id: _2ch,  day_of_week_id: 土 },
  { title: '電波教師', start_time: '17:30:00', channel_id: _4ch,  day_of_week_id: 土 },
  { title: '終わりのセラフ', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'ガンスリンガーストラトス', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'Fate stay night UBW', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'プラスティックメモリーズ', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'ワールドトリガー', start_time: '06:30:00', channel_id: _5ch,  day_of_week_id: 日 },
  { title: 'ドラゴンボール改', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'アルスラーン戦記', start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日 },
  { title: '攻殻機動隊AAA', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: '山田くんと7人の魔女', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日 },
  { title: '血界戦線', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 月 }
])
