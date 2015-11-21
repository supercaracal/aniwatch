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
  { title: '落第騎士の英雄譚', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 月 },
  { title: 'ワンパンマン', start_time: '01:00:00', channel_id: _7ch,  day_of_week_id: 月 },
  { title: 'ゆるゆり さん☆ハイ', start_time: '02:00:00', channel_id: _9ch,  day_of_week_id: 火 },
  { title: '緋弾のアリアAA', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 水 },
  { title: 'アニサン劇場', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 水 },
  { title: '銀魂', start_time: '18:00:00', channel_id: _7ch,  day_of_week_id: 水 },
  { title: '櫻子さんの足下には死体が埋まっている', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: '対魔導学園35試験小隊', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木 },
  { title: '俺がお嬢様学校に「庶民サンプル」として拉致られた件', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 木 },
  { title: 'アクエリオンロゴス', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'すべてがFになる THE PERFECT INSIDER', start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金 },
  { title: 'ヤングブラックジャック', start_time: '02:15:00', channel_id: _6ch,  day_of_week_id: 金 },
  { title: 'ルパン三世', start_time: '02:45:00', channel_id: _4ch,  day_of_week_id: 金 },
  { title: 'うしおととら', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 金 },
  { title: 'ヘヴィーオブジェクト', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: 'ノラガミ ARAGOTO', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '牙狼 紅蓮ノ月', start_time: '01:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: 'K RETURN OF KINGS', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 土 },
  { title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土 },
  { title: '終わりのセラフ', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '学戦都市アスタリスク', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土 },
  { title: '終物語', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'ワールドトリガー', start_time: '06:30:00', channel_id: _5ch,  day_of_week_id: 日 },
  { title: 'ドラゴンボール超', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日 },
  { title: '機動戦士ガンダム 鉄血のオルフェンズ', start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日 },
  { title: '小森さんは断れない', start_time: '22:27:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'コメットルシファー', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'コンクリートレボルティオ 超人幻想', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: '進撃!巨人中学校', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 日 },
  { title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日 }
])
