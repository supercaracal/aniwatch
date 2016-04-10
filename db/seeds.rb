# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
# cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# Mayor.create(name: 'Emanuel', city: cities.first)

_ch1 = Channel.create(name: 'NHK総合', code: '1ch')
ch2 = Channel.create(name: 'Eテレ', code: '2ch')
ch4 = Channel.create(name: '日本テレビ', code: '4ch')
_ch5 = Channel.create(name: 'テレビ朝日', code: '5ch')
ch6 = Channel.create(name: 'TBSテレビ', code: '6ch')
ch7 = Channel.create(name: 'テレビ東京', code: '7ch')
ch8 = Channel.create(name: 'フジテレビ', code: '8ch')
ch9 = Channel.create(name: 'TOKYO MX', code: '9ch')
_ch3 = Channel.create(name: 'テレ玉', code: '10ch')
_ch103 = Channel.create(name: 'BSプレミアム', code: '103')
_ch161 = Channel.create(name: 'BS-TBS', code: '161')
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
  { title: '三者三葉', start_time: '00:00:00', channel: ch9, day_of_week: mon },
  { title: 'くまみこ', start_time: '00:30:00', channel: ch9, day_of_week: mon },
  { title: 'Re:ゼロから始める異世界生活', start_time: '01:30:00', channel: ch7, day_of_week: mon },
  { title: 'ばくおん!!', start_time: '00:00:00', channel: ch9, day_of_week: tue },
  { title: 'ワガママハイスペック', start_time: '01:10:00', channel: ch9, day_of_week: tue },
  { title: '聖戦ケルベロス 竜刻のファタリテ', start_time: '01:30:00', channel: ch9, day_of_week: tue },
  { title: 'ハンドレッド', start_time: '02:00:00', channel: ch9, day_of_week: tue },
  { title: 'ジョーカー・ゲーム', start_time: '00:30:00', channel: ch9, day_of_week: wed },
  { title: '双星の陰陽師', start_time: '18:30:00', channel: ch7, day_of_week: wed },
  { title: '文豪ストレイドッグス', start_time: '01:05:00', channel: ch9, day_of_week: thu },
  { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
  { title: 'NARUTO疾風伝', start_time: '19:30:00', channel: ch7, day_of_week: thu },
  { title: 'クロムクロ', start_time: '22:00:00', channel: ch9, day_of_week: thu },
  { title: 'あんハピ♪', start_time: '22:30:00', channel: ch9, day_of_week: thu },
  { title: 'ネトゲの嫁は女の子じゃないと思った？', start_time: '23:30:00', channel: ch9, day_of_week: thu },
  { title: '甲鉄城のカバネリ', start_time: '02:30:00', channel: ch8, day_of_week: fri },
  { title: '暗殺教室', start_time: '03:00:00', channel: ch8, day_of_week: fri },
  { title: '少年メイド', start_time: '04:00:00', channel: ch6, day_of_week: fri },
  { title: '坂本ですが？', start_time: '04:30:00', channel: ch6, day_of_week: fri },
  { title: 'うしおととら', start_time: '22:30:00', channel: ch9, day_of_week: fri },
  { title: 'ウルトラスーパーアニメタイム', start_time: '23:00:00', channel: ch9, day_of_week: fri },
  { title: 'ジョジョの奇妙な冒険 ダイヤモンドは砕けない', start_time: '00:30:00', channel: ch9, day_of_week: sat },
  { title: 'テラフォーマーズ リベンジ', start_time: '01:00:00', channel: ch9, day_of_week: sat },
  { title: 'ビッグオーダー', start_time: '01:30:00', channel: ch9, day_of_week: sat },
  { title: '迷い家', start_time: '02:00:00', channel: ch6, day_of_week: sat },
  { title: 'マギ シンドバッドの冒険', start_time: '02:30:00', channel: ch6, day_of_week: sat },
  { title: '境界のRINNE2', start_time: '17:30:00', channel: ch2, day_of_week: sat },
  { title: '逆転裁判', start_time: '17:30:00', channel: ch4, day_of_week: sat },
  { title: '田中くんはいつもけだるげ', start_time: '22:00:00', channel: ch9, day_of_week: sat },
  { title: 'キズナイーバー', start_time: '23:30:00', channel: ch9, day_of_week: sat },
  { title: 'はいふり', start_time: '00:00:00', channel: ch9, day_of_week: sun },
  { title: '学園都市アスタリスク', start_time: '00:30:00', channel: ch9, day_of_week: sun },
  { title: 'ふらいんぐうぃっち', start_time: '02:30:00', channel: ch4, day_of_week: sun },
  { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
  { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
  { title: '僕のヒーローアカデミア', start_time: '17:00:00', channel: ch6, day_of_week: sun },
  { title: 'とんかつDJアゲ太郎', start_time: '22:15:00', channel: ch9, day_of_week: sun },
  { title: 'マクロス Δ', start_time: '22:30:00', channel: ch9, day_of_week: sun },
  { title: 'コンクリート・レボルティオ～超人幻想～THE LAST SONG', start_time: '23:00:00', channel: ch9, day_of_week: sun },
  { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
])
