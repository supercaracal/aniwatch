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
    { title: '干物妹!うまるちゃんR', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: '血界戦線&BEYOND', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: '銀魂', start_time: '02:00:00', channel: ch7, day_of_week: mon },
    { title: 'UQ HOLDER', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: 'つうかあ', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: 'ネト充のススメ', start_time: '01:40:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: 'アイドルマスターシンデレラガールズ劇場', start_time: '21:55:00', channel: ch9, day_of_week: tue },
    { title: '食戟のソーマ 餐ノ皿', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: '怪獣娘 ウルトラ怪獣擬人化計画', start_time: '01:35:00', channel: ch9, day_of_week: wed },
    { title: 'EVIL OR LIVE', start_time: '01:40:00', channel: ch9, day_of_week: wed },
    { title: 'Infini-T force', start_time: '02:00:00', channel: ch4, day_of_week: wed },
    { title: 'BORUTO', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: '僕の彼女がマジメ過ぎるしょビッチな件', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: '十二対戦', start_time: '00:00:00', channel: ch9, day_of_week: fri },
    { title: 'いぬやしき', start_time: '01:20:00', channel: ch8, day_of_week: fri },
    { title: '牙狼 VANISHING LINE', start_time: '01:20:00', channel: ch7, day_of_week: sat },
    { title: '将国のアルタイル', start_time: '02:40:00', channel: ch6, day_of_week: sat },
    { title: '宝石の国', start_time: '22:00:00', channel: ch9, day_of_week: sat },
    { title: 'Fate/Apocrypha', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'ブレンドS', start_time: '00:30:00', channel: ch9, day_of_week: sun },
    { title: '魔法使いの嫁', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: '妹さえいればいい。', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: 'クジラの子らは砂上に歌う', start_time: '23:00:00', channel: ch9, day_of_week: sun },
    { title: 'ボールルームへようこそ', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
