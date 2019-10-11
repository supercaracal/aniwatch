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
    { title: 'ヴィンランド・サガ', start_time: '00:10:00', channel: ch1, day_of_week: mon },
    { title: 'バビロン', start_time: '22:00:00', channel: ch9, day_of_week: mon },
    { title: 'PSO2', start_time: '22:30:00', channel: ch9, day_of_week: mon },
    { title: '私、能力は平均値でって言ったよね!', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: '七つの大罪', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: '慎重勇者', start_time: '23:30:00', channel: ch9, day_of_week: wed },
    { title: '俺を好きなのはお前だけかよ', start_time: '00:03:00', channel: ch9, day_of_week: thu },
    { title: '旗揚！けものみち', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: 'BEASTARS', start_time: '01:00:00', channel: ch8, day_of_week: thu },
    { title: '超人高校生たちは異世界でも余裕で生き抜くようです！', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: 'アズールレーン', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'アサシンズプライド', start_time: '00:00:00', channel: ch9, day_of_week: fri },
    { title: 'ノー・ガンズ・ライフ', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: 'Dr.STONE', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: 'GRANBLUE FANTASY 2', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: '食戟のソーマ 神ノ皿', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'どるふろ 癒し編', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: 'ハイスコアガール', start_time: '01:05:00', channel: ch9, day_of_week: sat },
    { title: '炎炎ノ消防隊', start_time: '01:30:00', channel: ch6, day_of_week: sat },
    { title: '歌舞伎町シャーロック', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: '真・中華一番', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '僕のヒーローアカデミア', start_time: '17:30:00', channel: ch4, day_of_week: sat },
    { title: '魔入りました！入間くん', start_time: '17:30:00', channel: ch2, day_of_week: sat },
    { title: 'ガンダムビルドダイバーズRe:RISE', start_time: '19:00:00', channel: ch211, day_of_week: sat },
    { title: 'Fate/Grand Order 絶対魔獣戦線バビロニア', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'Sword Art Online Alicization War of Underworld', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: '戦x恋', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: '警視庁 特務部 特殊凶悪犯対策室 第七課', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: 'ライフル・イズ・ビューティフル', start_time: '23:00:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
