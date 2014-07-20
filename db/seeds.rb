# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

_1ch =  Channel.create({name: 'NHK総合',      code: '1ch'}).id
_2ch =  Channel.create({name: 'Eテレ',        code: '2ch'}).id
_4ch =  Channel.create({name: '日本テレビ',   code: '4ch'}).id
_5ch =  Channel.create({name: 'テレビ朝日',   code: '5ch'}).id
_6ch =  Channel.create({name: 'TBSテレビ',    code: '6ch'}).id
_7ch =  Channel.create({name: 'テレビ東京',   code: '7ch'}).id
_8ch =  Channel.create({name: 'フジテレビ',   code: '8ch'}).id
_9ch =  Channel.create({name: 'TOKYO MX',     code: '9ch'}).id
_3ch =  Channel.create({name: 'テレ玉',       code: '10ch'}).id
_BS3 =  Channel.create({name: 'BSプレミアム', code: 'BS3'}).id
_BS8 =  Channel.create({name: 'BSフジ',       code: 'BS8'}).id
_BS11 = Channel.create({name: 'BS11',         code: 'BS11'}).id

月 = DayOfWeek.create({name: '月', code: 'mon'}).id
火 = DayOfWeek.create({name: '火', code: 'tue'}).id
水 = DayOfWeek.create({name: '水', code: 'wed'}).id
木 = DayOfWeek.create({name: '木', code: 'thu'}).id
金 = DayOfWeek.create({name: '金', code: 'fri'}).id
土 = DayOfWeek.create({name: '土', code: 'sat'}).id
日 = DayOfWeek.create({name: '日', code: 'sun'}).id

Lineup.create([
  {title: 'アカメが斬る', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 月},
  {title: '月刊少女野崎くん', start_time: '01:00:00', channel_id: _7ch,  day_of_week_id: 月},
  {title: 'TopGear', start_time: '23:00:00', channel_id: _BS8,  day_of_week_id: 月},
  {title: 'M3ソノ黒キ鋼', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 火},
  {title: 'HUNTERxHUNTER', start_time: '01:30:00', channel_id: _4ch,  day_of_week_id: 水},
  {title: 'Free!-Eternal Summer', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 木},
  {title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木},
  {title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木},
  {title: '白銀の意思', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 木},
  {title: '東京喰種', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 金},
  {title: '残響のテロル', start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金},
  {title: 'ジョジョの奇妙な冒険3部', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: '六畳間の侵略者!?', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: '東京ESP', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: '信長協奏曲', start_time: '02:00:00', channel_id: _8ch,  day_of_week_id: 土},
  {title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土},
  {title: 'ソードアート・オンラインII', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: 'アルドノア・ゼロ', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: '魔法科高校の劣等生', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: '戦国BASARA Judge End', start_time: '02:00:00', channel_id: _4ch,  day_of_week_id: 日},
  {title: 'ばらかもん', start_time: '02:30:00', channel_id: _4ch,  day_of_week_id: 日},
  {title: '仮面ライダー', start_time: '08:00:00', channel_id: _5ch,  day_of_week_id: 日},
  {title: 'プリキュア', start_time: '08:30:00', channel_id: _5ch,  day_of_week_id: 日},
  {title: 'ドラゴンボール改', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日},
  {title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日},
  {title: '人生相談アニメーション人生', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'さばげぶっ!', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'スペース☆ダンディ', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'キャプテン・アース', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日},
])
