# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

# rubocop:disable Lint/UselessAssignment
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
# rubocop:enable Lint/UselessAssignment

Lineup.create(
  [
    { title: 'Fairy gone', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: '八月のシンデレラナイン', start_time: '01:30:00', channel: ch7, day_of_week: mon },
    { title: '八十亀ちゃん', start_time: '21:54:00', channel: ch9, day_of_week: mon },
    { title: 'どろろ', start_time: '22:00:00', channel: ch9, day_of_week: mon },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: 'アイドルマスターシンデレラガールズ劇場', start_time: '21:54:00', channel: ch9, day_of_week: tue },
    { title: '異世界かるてっと', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: 'ストライクウィッチーズ501部隊発進しますっ!', start_time: '00:45:00', channel: ch9, day_of_week: wed },
    { title: 'ワンパンマン', start_time: '01:30:00', channel: ch7, day_of_week: wed },
    { title: 'この世の果で恋を唄う少女YU-NO', start_time: '22:00:00', channel: ch9, day_of_week: wed },
    { title: '世話やきキツネの仙狐さん', start_time: '23:30:00', channel: ch9, day_of_week: wed },
    { title: '盾の勇者の成り上がり', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: 'からくりサーカス', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: '賢者の孫', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'さらざんまい', start_time: '01:00:00', channel: ch8, day_of_week: fri },
    { title: 'ジョジョの奇妙な冒険 黄金の嵐', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: 'みだらな青ちゃんは勉強ができない', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: '鬼滅の刃', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'FAIRY TAIL', start_time: '07:00:00', channel: ch7, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: '群青のマグメル', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: '消滅都市', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
