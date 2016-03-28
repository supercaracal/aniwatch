# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

_ch1 = Channel.create(name: 'NHK総合', code: '1ch')
_ch2 = Channel.create(name: 'Eテレ', code: '2ch')
ch4 = Channel.create(name: '日本テレビ', code: '4ch')
ch5 = Channel.create(name: 'テレビ朝日', code: '5ch')
ch6 = Channel.create(name: 'TBSテレビ', code: '6ch')
ch7 = Channel.create(name: 'テレビ東京', code: '7ch')
ch8 = Channel.create(name: 'フジテレビ', code: '8ch')
ch9 = Channel.create(name: 'TOKYO MX', code: '9ch')
_ch3 = Channel.create(name: 'テレ玉', code: '10ch')
_ch103 = Channel.create(name: 'BSプレミアム', code: '103')
ch161 = Channel.create(name: 'BS-TBS', code: '161')
_ch181 = Channel.create(name: 'BSフジ', code: '181')
_ch211 = Channel.create(name: 'BS11', code: '211')

mon = DayOfWeek.create(name: '月', code: 'mon')
tue = DayOfWeek.create(name: '火', code: 'tue')
wed = DayOfWeek.create(name: '水', code: 'wed')
thu = DayOfWeek.create(name: '木', code: 'thu')
fri = DayOfWeek.create(name: '金', code: 'fri')
sat = DayOfWeek.create(name: '土', code: 'sat')
sun = DayOfWeek.create(name: '日', code: 'sun')

Lineup.create([
  { title: 'くまみこ', start_time: '00:30:00', channel: ch9, day_of_week: mon },
  { title: 'Re:ゼロから始める異世界生活', start_time: '01:30:00', channel: ch7, day_of_week: mon },
  { title: '最弱無敗の神装機竜', start_time: '00:30:00', channel: ch9, day_of_week: tue },
  { title: '銀魂', start_time: '18:00:00', channel: ch7, day_of_week: wed },
  { title: '無彩限のファントム・ワールド', start_time: '00:00:00', channel: ch9, day_of_week: thu },
  { title: 'この素晴らしい世界に祝福を！', start_time: '01:00:00', channel: ch9, day_of_week: thu },
  { title: 'ハルチカ ハルタとチカは青春する', start_time: '01:30:00', channel: ch9, day_of_week: thu },
  { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel: ch7, day_of_week: thu },
  { title: '少女たちは荒野を目指す', start_time: '22:30:00', channel: ch9, day_of_week: thu },
  { title: 'ルパン三世', start_time: '02:00:00', channel: ch4, day_of_week: fri },
  { title: '僕だけがいない街', start_time: '02:00:00', channel: ch8, day_of_week: fri },
  { title: '暗殺教室', start_time: '02:30:00', channel: ch8, day_of_week: fri },
  { title: 'ディバインゲート', start_time: '22:30:00', channel: ch9, day_of_week: fri },
  { title: 'ウルトラスーパーアニメタイム', start_time: '23:00:00', channel: ch9, day_of_week: fri },
  { title: 'ジョジョの奇妙な冒険 ダイヤモンドは砕けない', start_time: '00:30:00', channel: ch9, day_of_week: sat },
  { title: 'テラフォーマーズ リベンジ', start_time: '01:00:00', channel: ch9, day_of_week: sat },
  { title: '亜人', start_time: '02:00:00', channel: ch6, day_of_week: sat },
  { title: '昭和元禄落語心中', start_time: '02:30:00', channel: ch6, day_of_week: sat },
  { title: '逆転裁判', start_time: '17:30:00', channel: ch4, day_of_week: sat },
  { title: 'キズナイーバー', start_time: '23:30:00', channel: ch9, day_of_week: sat },
  { title: '学園都市アスタリスク', start_time: '00:30:00', channel: ch9, day_of_week: sun },
  { title: 'だがしかし', start_time: '01:30:00', channel: ch161, day_of_week: sun },
  { title: 'Re:ゼロから始める異世界体験', start_time: '02:00:00', channel: ch7, day_of_week: sun },
  { title: 'ワールドトリガー', start_time: '06:30:00', channel: ch5, day_of_week: sun },
  { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
  { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
  { title: '僕のヒーローアカデミア', start_time: '17:00:00', channel: ch6, day_of_week: sun },
  { title: 'マクロス Δ', start_time: '22:30:00', channel: ch9, day_of_week: sun },
  { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
])
