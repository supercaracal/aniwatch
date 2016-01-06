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
  { title: '灰と幻想のグリムガル', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 月 },
  { title: 'シュヴァルツェス マーケン', start_time: '01:00:00', channel_id: _7ch,  day_of_week_id: 月 },
  { title: '最弱無敗の神装機竜', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: '蒼の彼方のフォーリズム', start_time: '02:00:00', channel_id: _7ch,  day_of_week_id: 火 },
  { title: '銀魂', start_time: '18:00:00', channel_id: _7ch,  day_of_week_id: 水 },
  { title: '聖闘士星矢 the lost canvas 冥王神話', start_time: '19:30:00', channel_id: _9ch,  day_of_week_id: 水 },
  { title: '無彩限のファントム・ワールド', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'ハルチカ ハルタとチカは青春する', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'アクティヴレイド 機動強襲室第八係', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: '少女たちは荒野を目指す', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'ルパン三世', start_time: '02:00:00', channel_id: _4ch,  day_of_week_id: 金 },
  { title: '僕だけがいない街', start_time: '02:00:00', channel_id: _8ch,  day_of_week_id: 金 },
  { title: 'ファンタシースターオンライン2 ジ アニメーション', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: '暗殺教室', start_time: '02:30:00', channel_id: _8ch,  day_of_week_id: 金 },
  { title: 'だがしかし', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: 'ディバインゲート', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'ウルトラスーパーアニメタイム', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'ヘヴィーオブジェクト', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'GATE(ゲート) 自衛隊 彼の地にて、斯く戦えり', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '牙狼 紅蓮ノ月', start_time: '01:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: '昭和元禄落語心中', start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: 'ブブキ・ブランキ', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'ラクエンロジック', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'デュラララ!!x2 結', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '霊剣山 星屑たちの宴', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'ナースウィッチ小麦ちゃんR', start_time: '02:30:00', channel_id: _4ch,  day_of_week_id: 日 },
  { title: '紅殻のパンドラ', start_time: '03:00:00', channel_id: _BS11,  day_of_week_id: 日 },
  { title: 'ワールドトリガー', start_time: '06:30:00', channel_id: _5ch,  day_of_week_id: 日 },
  { title: 'ドラゴンボール超', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: '機動戦士ガンダム 鉄血のオルフェンズ', start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日 },
  { title: '大家さんは思春期', start_time: '22:27:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'Dimension W', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日 }
])
