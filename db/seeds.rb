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
    { title: 'ドロヘドロ', start_time: '00:00:00', channel: ch7, day_of_week: mon },
    { title: 'ID:INVADED', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: '映像研には手を出すな!', start_time: '00:10:00', channel: ch1, day_of_week: mon },
    { title: 'へやキャン', start_time: '21:54:00', channel: ch9, day_of_week: mon },
    { title: 'pet', start_time: '22:00:00', channel: ch9, day_of_week: mon },
    { title: 'PSO2', start_time: '22:30:00', channel: ch9, day_of_week: mon },
    { title: '群れなせ!シートン学園', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: '八十亀ちゃんかんさつにっき 2さつめ', start_time: '01:00:00', channel: ch9, day_of_week: tue },
    { title: 'なつなぐ!', start_time: '01:35:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: 'バビロン', start_time: '01:30:00', channel: ch9, day_of_week: wed },
    { title: 'ちはやふる', start_time: '01:30:00', channel: ch4, day_of_week: wed },
    { title: '七つの大罪', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: '魔術士オーフェンはぐれ旅', start_time: '22:00:00', channel: ch9, day_of_week: wed },
    { title: 'プランダラ', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: '空挺ドラゴンズ', start_time: '01:00:00', channel: ch8, day_of_week: thu },
    { title: '痛いのは嫌なので防御力に極振りしたいと思います。', start_time: '01:30:00', channel: ch9, day_of_week: thu },
    { title: 'ネコぱら', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: 'Infinite Dendrogram', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'ソマリと森の神様', start_time: '00:30:00', channel: ch9, day_of_week: fri },
    { title: '推しが武道館いってくれたら死ぬ', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: '地縛少年花子くん', start_time: '02:00:00', channel: ch6, day_of_week: fri },
    { title: '恋する小惑星', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: 'Darwins Game', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: '理系が恋に落ちたので証明してみた。', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'どるふろ 狂乱編', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: 'とある科学の超電磁砲T', start_time: '01:05:00', channel: ch9, day_of_week: sat },
    { title: '織田シナモン信長', start_time: '01:30:00', channel: ch7, day_of_week: sat },
    { title: 'ケンガンアシュラ', start_time: '01:30:00', channel: ch9, day_of_week: sat },
    { title: '歌舞伎町シャーロック', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: 'はてなイリュージョン', start_time: '02:00:00', channel: ch9, day_of_week: sat },
    { title: 'ランウェイで笑って', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '僕のヒーローアカデミア', start_time: '17:30:00', channel: ch4, day_of_week: sat },
    { title: '魔入りました！入間くん', start_time: '17:30:00', channel: ch2, day_of_week: sat },
    { title: 'ガンダムビルドダイバーズRe:RISE', start_time: '19:00:00', channel: ch211, day_of_week: sat },
    { title: '22/7', start_time: '23:00:00', channel: ch9, day_of_week: sat },
    { title: 'Fate/Grand Order 絶対魔獣戦線バビロニア', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'マギアレコード', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: '異種族レビュアーズ', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: '虚構推理', start_time: '01:30:00', channel: ch5, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
