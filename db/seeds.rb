# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

# rubocop:disable Metrics/UselessAssignment
ch1 = Channel.create(name: 'NHK総合', code: '1ch')
ch2 = Channel.create(name: 'Eテレ', code: '2ch')
ch4 = Channel.create(name: '日本テレビ', code: '4ch')
ch5 = Channel.create(name: 'テレビ朝日', code: '5ch')
ch6 = Channel.create(name: 'TBSテレビ', code: '6ch')
ch7 = Channel.create(name: 'テレビ東京', code: '7ch')
ch8 = Channel.create(name: 'フジテレビ', code: '8ch')
ch9 = Channel.create(name: 'TOKYO MX', code: '9ch')
ch3 = Channel.create(name: 'テレ玉', code: '10ch')
ch103 = Channel.create(name: 'BSプレミアム', code: '103')
ch161 = Channel.create(name: 'BS-TBS', code: '161')
ch181 = Channel.create(name: 'BSフジ', code: '181')
ch211 = Channel.create(name: 'BS11', code: '211')

mon = DayOfWeek.create(name: '月', code: 'mon')
tue = DayOfWeek.create(name: '火', code: 'tue')
wed = DayOfWeek.create(name: '水', code: 'wed')
thu = DayOfWeek.create(name: '木', code: 'thu')
fri = DayOfWeek.create(name: '金', code: 'fri')
sat = DayOfWeek.create(name: '土', code: 'sat')
sun = DayOfWeek.create(name: '日', code: 'sun')
# rubocop:enable Metrics/UselessAssignment

Lineup.create(
  [
    { title: '潔癖男!青山くん', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: '恋と嘘', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: '天使の3P!', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: '異世界食堂', start_time: '01:30:00', channel: ch7, day_of_week: tue },
    { title: '徒然チルドレン', start_time: '23:15:00', channel: ch9, day_of_week: tue },
    { title: 'NEW GAME!!', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: 'ナナマルサンバツ', start_time: '02:00:00', channel: ch4, day_of_week: wed },
    { title: 'BORUTO', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: 'クリオネの灯り', start_time: '22:30:00', channel: ch9, day_of_week: wed },
    { title: 'てーきゅう', start_time: '22:40:00', channel: ch9, day_of_week: wed },
    { title: 'ノラと皇女と野良猫ハート', start_time: '22:45:00', channel: ch9, day_of_week: wed },
    { title: 'サクラクエスト', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'ようこそ実力至上主義の教室へ', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: '捏造トラップ', start_time: '03:40:00', channel: ch9, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: 'ゲーマーズ!', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'RWBY', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: 'メイドインアビス', start_time: '01:30:00', channel: ch9, day_of_week: sat },
    { title: '神撃のバハムート Virgin Soul', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: '将国のアルタイル', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '僕のヒーローアカデミア', start_time: '17:30:00', channel: ch4, day_of_week: sat },
    { title: '境界のRINNE3', start_time: '17:30:00', channel: ch2, day_of_week: sat },
    { title: '賭ケグルイ', start_time: '22:00:00', channel: ch9, day_of_week: sat },
    { title: 'ひなろじ', start_time: '22:30:00', channel: ch9, day_of_week: sat },
    { title: 'Re:CREATORS', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'Fate/Apocrypha', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'セントールの悩み', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: 'ナイツ&マジック', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: 'プリンセス・プリンシパル', start_time: '23:00:00', channel: ch9, day_of_week: sun },
    { title: 'ボールルームへようこそ', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
