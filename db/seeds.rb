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
    { title: 'みにとじ', start_time: '21:54:00', channel: ch9, day_of_week: mon },
    { title: 'どろろ', start_time: '22:00:00', channel: ch9, day_of_week: mon },
    { title: 'モブサイコ100II', start_time: '23:00:00', channel: ch9, day_of_week: mon },
    { title: '転生したらスライムだった件', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: 'けものフレンズ2', start_time: '02:00:00', channel: ch7, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: 'ケムリクサ', start_time: '22:30:00', channel: ch9, day_of_week: wed },
    { title: 'バーチャルさんはみている', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'revisions', start_time: '01:00:00', channel: ch8, day_of_week: thu },
    { title: '盾の勇者の成り上がり', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: 'からくりサーカス', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: 'ガーリー・エアフォース', start_time: '00:30:00', channel: ch9, day_of_week: fri },
    { title: '約束のネバーランド', start_time: '01:00:00', channel: ch8, day_of_week: fri },
    { title: '五頭分の花嫁', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: 'グリムノーツ', start_time: '02:00:00', channel: ch6, day_of_week: fri },
    { title: 'ブギーポップは笑わない', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: 'とある魔術の禁書目録III', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'ジョジョの奇妙な冒険 黄金の嵐', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: '宇宙戦艦ヤマト2202', start_time: '01:20:00', channel: ch7, day_of_week: sat },
    { title: '魔法少女特殊戦あすか', start_time: '02:15:00', channel: ch6, day_of_week: sat },
    { title: 'かぐや様は告らせたい', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'Sword Art Online Alicization', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'えんどろ～', start_time: '01:00:00', channel: ch9, day_of_week: sun },
    { title: 'デート・ア・ライブIII', start_time: '03:00:00', channel: ch211, day_of_week: sun },
    { title: 'FAIRY TAIL', start_time: '07:00:00', channel: ch7, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: '荒野のコトブキ飛行隊', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: '賭ケグルイxx', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
