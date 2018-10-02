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
    { title: 'アニマエール!', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: 'バキ', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: '進撃の巨人', start_time: '00:30:00', channel: ch1, day_of_week: mon },
    { title: 'ひもてはうす', start_time: '01:50:00', channel: ch9, day_of_week: mon },
    { title: 'あかねさす少女', start_time: '22:30:00', channel: ch9, day_of_week: mon },
    { title: '転生したらスライムだった件', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: '宇宙戦艦ティラミスII', start_time: '01:00:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: '風が強く吹いている', start_time: '01:30:00', channel: ch4, day_of_week: wed },
    { title: '中間管理録トネガワ', start_time: '02:00:00', channel: ch4, day_of_week: wed },
    { title: 'ソラとウミのアイダ', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'RErideD', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: '番組内容未定', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: 'ゾンビランドサガ', start_time: '00:00:00', channel: ch9, day_of_week: fri },
    { title: 'BANANA FISH', start_time: '01:00:00', channel: ch8, day_of_week: fri },
    { title: '学園BASARA', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: '火ノ丸相撲', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: 'やがて君になる', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: 'とある魔術の禁書目録III', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'ジョジョの奇妙な冒険 黄金の嵐', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: '宇宙戦艦ヤマト2202', start_time: '01:20:00', channel: ch7, day_of_week: sat },
    { title: '寄宿学校のジュリエット', start_time: '01:40:00', channel: ch6, day_of_week: sat },
    { title: '色づく世界の明日から', start_time: '02:10:00', channel: ch6, day_of_week: sat },
    { title: 'となりの吸血鬼さん', start_time: '22:00:00', channel: ch9, day_of_week: sat },
    { title: '青春ブタ野郎はバニーガール先輩の夢を見ない', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'Sword Art Online Alicization', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'SSSS GRIDMAN', start_time: '01:00:00', channel: ch9, day_of_week: sun },
    { title: 'ゴブリンスレイヤー', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'うちのメイドがウザすぎる!', start_time: '03:00:00', channel: ch211, day_of_week: sun },
    { title: 'FAIRY TAIL', start_time: '07:00:00', channel: ch7, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: 'ユリシーズ ジャンヌ・ダルクと錬金の騎士', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: 'DOUBLE DECKER!', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: 'RELEASE THE SPYCE', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
