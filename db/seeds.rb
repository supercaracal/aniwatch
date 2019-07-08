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
    { title: 'ヴィンランド・サガ', start_time: '00:10:00', channel: ch1, day_of_week: mon },
    { title: 'ナカノヒトゲノム', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: 'BEM', start_time: '01:30:00', channel: ch7, day_of_week: mon },
    { title: 'かつて神だった獣たちへ', start_time: '23:00:00', channel: ch9, day_of_week: mon },
    { title: 'コップクラフト', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: 'ありふれた職業で世界最強', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: '手品先輩', start_time: '23:00:00', channel: ch9, day_of_week: tue },
    { title: 'ソウナンですか?', start_time: '23:15:00', channel: ch9, day_of_week: tue },
    { title: '可愛ければ変態でも好きになってくれますか?', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: 'この世の果で恋を唄う少女YU-NO', start_time: '22:00:00', channel: ch9, day_of_week: wed },
    { title: 'ダンベル何キロ持てる?', start_time: '23:30:00', channel: ch9, day_of_week: wed },
    { title: '魔王様リトライ!', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: '彼方のアストラ', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: '異世界チート魔術師', start_time: '01:30:00', channel: ch9, day_of_week: thu },
    { title: 'Carole and Tuesday', start_time: '01:00:00', channel: ch8, day_of_week: thu },
    { title: 'うちの娘の為ならば、俺はもしかしたら魔王も倒せるかもしれない。', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'まちカドまぞく', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: 'Dr.STONE', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: '女子高生の無駄づかい', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: '通常攻撃が全体攻撃で二回攻撃のお母さんは好きですか?', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: 'ダンジョンに出会いを求めるのは間違っているだろうかII', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'とある科学の一方通行', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: '炎炎ノ消防隊', start_time: '01:30:00', channel: ch6, day_of_week: sat },
    { title: 'グランベルム', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: '荒ぶる季節の乙女どもよ。', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '鬼滅の刃', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'ロード・エルメロイII世の事件簿', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'FAIRY TAIL', start_time: '07:00:00', channel: ch7, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'BORUTO', start_time: '17:30:00', channel: ch7, day_of_week: sun },
    { title: 'ポケモン', start_time: '18:00:00', channel: ch7, day_of_week: sun },
    { title: 'PSO2', start_time: '23:00:00', channel: ch9, day_of_week: sun },
    { title: 'からかい上手の高木さん2', start_time: '23:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
