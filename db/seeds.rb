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
    { title: 'Re:ゼロから始める異世界生活', start_time: '01:30:00', channel: ch7, day_of_week: mon },
    { title: '斉木楠雄のΨ難', start_time: '02:00:00', channel: ch7, day_of_week: mon },
    { title: 'ダンガンロンパ3 未来編', start_time: '23:00:00', channel: ch9, day_of_week: mon },
    { title: 'モブサイコ100', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: '甘々と稲妻', start_time: '01:00:00', channel: ch9, day_of_week: tue },
    { title: 'D.Gray-man', start_time: '01:30:00', channel: ch7, day_of_week: tue },
    { title: 'タブー・タトゥー', start_time: '02:00:00', channel: ch7, day_of_week: tue },
    { title: 'NEW GAME!', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: '双星の陰陽師', start_time: '18:30:00', channel: ch7, day_of_week: wed },
    { title: '仮面ライダーアマゾンズ', start_time: '22:30:00', channel: ch9, day_of_week: wed },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: 'NARUTO疾風伝', start_time: '19:30:00', channel: ch7, day_of_week: thu },
    { title: 'クロムクロ', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: 'ダンガンロンパ3 絶望編', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'ReLIFE', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: 'ジョジョの奇妙な冒険 ダイヤモンドは砕けない', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: '91days', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: 'ベルセルク', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '境界のRINNE2', start_time: '17:30:00', channel: ch2, day_of_week: sat },
    { title: '食戟のソーマ 弐ノ皿', start_time: '22:00:00', channel: ch9, day_of_week: sat },
    { title: 'Rewrite', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'アルスラーン戦記 風塵乱舞', start_time: '17:00:00', channel: ch6, day_of_week: sun },
    { title: 'マクロスΔ', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: 'Tales of Zestiria the X', start_time: '23:00:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
