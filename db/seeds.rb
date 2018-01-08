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
    { title: '刻刻', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: '銀魂', start_time: '02:00:00', channel: ch7, day_of_week: mon },
    { title: 'からかい上手の高木さん', start_time: '23:00:00', channel: ch9, day_of_week: mon },
    { title: 'バジリスク桜花忍法帖', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: 'りゅうおうのおしごと!', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: '怪獣娘2', start_time: '21:54:00', channel: ch9, day_of_week: tue },
    { title: '宇宙よりも遠い場所', start_time: '23:00:00', channel: ch9, day_of_week: tue },
    { title: 'オーバーロードII', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: '一人之下', start_time: '01:40:00', channel: ch9, day_of_week: wed },
    { title: 'BORUTO', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: 'ヴァイオレット・エヴァーガーデン', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: 'ラーメン大好き小泉さん', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: 'メルヘン・メドヘン', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: 'ゆるキャン', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'デスマーチからはじまる異世界狂想曲', start_time: '00:00:00', channel: ch9, day_of_week: fri },
    { title: '恋は雨上がりのように', start_time: '01:00:00', channel: ch8, day_of_week: fri },
    { title: 'ミイラの飼い方', start_time: '02:00:00', channel: ch6, day_of_week: fri },
    { title: '覇穹 封神演義', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: 'ハクメイとミコチ', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: 'グランクレスト戦記', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: '博多豚骨ラーメンズ', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: '刀使ノ巫女', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: '牙狼 VANISHING LINE', start_time: '01:20:00', channel: ch7, day_of_week: sat },
    { title: 'BEATLESS', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: 'キリングバイツ', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '七つの大罪 戒めの復活', start_time: '06:30:00', channel: ch6, day_of_week: sat },
    { title: 'ダーリン・イン・ザ・フランキス', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'カーニバル・ファンタズム', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'スロウスタート', start_time: '00:30:00', channel: ch9, day_of_week: sun },
    { title: 'ポプテピピック', start_time: '01:00:00', channel: ch9, day_of_week: sun },
    { title: '魔法使いの嫁', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: '伊藤潤二コレクション', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: 'citrus', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
