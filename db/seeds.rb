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
  {title: 'ユリ熊嵐', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 火},
  {title: 'ガンダムビルドファイターズトライ', start_time: '18:00:00', channel_id: _7ch,  day_of_week_id: 水},
  {title: '寄生獣 セイの格率', start_time: '01:30:00', channel_id: _4ch,  day_of_week_id: 木},
  {title: 'ポケモン', start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木},
  {title: 'NARUTO疾風伝', start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木},
  {title: '白銀の意思 アルジェヴォルン', start_time: '23:00:00', channel_id: _9ch,  day_of_week_id: 木},
  {title: 'SHIROBAKO', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 木},
  {title: '東京喰種√A', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 金},
  {title: '冴えない彼女の育て方', start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金},
  {title: '幸腹グラフィティ', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 金},
  {title: 'ジョジョの奇妙な冒険III', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: '牙狼 GARO', start_time: '01:30:00', channel_id: _7ch,  day_of_week_id: 土},
  {title: 'Gのレコンギスタ', start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 土},
  {title: 'デスパレード', start_time: '02:00:00', channel_id: _4ch,  day_of_week_id: 土},
  {title: '暗殺教室', start_time: '10:00:00', channel_id: _BS8,  day_of_week_id: 土},
  {title: 'FAIRY TAIL', start_time: '10:30:00', channel_id: _7ch,  day_of_week_id: 土},
  {title: 'デュラララx2承', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 土},
  {title: 'アルドノアゼロ', start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'DOG DAYS2', start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'ワールドトリガー', start_time: '06:30:00', channel_id: _5ch,  day_of_week_id: 日},
  {title: 'ドラゴンボール改', start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日},
  {title: 'ワンピース', start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日},
  {title: '七つの大罪', start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日},
  {title: '夜のヤッターマン', start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: '純潔のマリア', start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'ローリングガールズ', start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 日},
  {title: 'SuperGT', start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日},
  {title: 'TopGear', start_time: '23:00:00', channel_id: _BS8,  day_of_week_id: 日},
])
