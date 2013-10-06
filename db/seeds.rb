# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

channels = Channel.create([
    {name: 'NHK総合',      code: '1ch'},  #0
    {name: 'Eテレ',        code: '2ch'},  #1
    {name: '日本テレビ',   code: '4ch'},  #2
    {name: 'テレビ朝日',   code: '5ch'},  #3
    {name: 'TBSテレビ',    code: '6ch'},  #4
    {name: 'テレビ東京',   code: '7ch'},  #5
    {name: 'フジテレビ',   code: '8ch'},  #6
    {name: 'テレ玉',       code: '3ch'},  #7
    {name: 'TOKYO MX',     code: '9ch'},  #8
    {name: 'BSプレミアム', code: 'BS3'},  #9
    {name: 'BSフジ',       code: 'BS8'},  #10
    {name: 'BS11',         code: 'BS11'}, #11
])

dayOfWeeks = DayOfWeek.create([
    {name: '月', code: 'mon'}, #0
    {name: '火', code: 'tue'}, #1
    {name: '水', code: 'wed'}, #2
    {name: '木', code: 'thu'}, #3
    {name: '金', code: 'fri'}, #4
    {name: '土', code: 'sat'}, #5
    {name: '日', code: 'sun'}, #6
])

Lineup.create([
#    {title: 'ファンタジスタドール',                     start_time: '00:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[0].id},
#    {title: '魔界王子 devils and realist',              start_time: '01:00:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[0].id},
    {title: 'ムシブギョー',                             start_time: '18:00:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[0].id},
    {title: 'Top Gear',                                 start_time: '23:00:00', channel_id: channels[10].id, day_of_week_id: dayOfWeeks[0].id},
    {title: 'きんいろモザイク',                         start_time: '00:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[1].id, point: 20},
    {title: '犬とハサミは使いよう',                     start_time: '01:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[1].id},
    {title: '神のみぞ知るセカイ',                       start_time: '01:30:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[1].id},
    {title: '私がモテないのはどう考えてもお前らが悪い', start_time: '02:00:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[1].id, point: 20},
#    {title: '義風堂々',                                 start_time: '01:40:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[2].id},
    {title: '探検バクモン',                             start_time: '22:50:00', channel_id: channels[0].id,  day_of_week_id: dayOfWeeks[2].id},
    {title: 'Free!',                                    start_time: '00:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[3].id},
    {title: 'ブラッドラッド',                           start_time: '01:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[3].id},
    {title: 'ポケモン',                                 start_time: '19:00:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[3].id},
    {title: 'NARUTO',                                   start_time: '19:30:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[3].id},
#    {title: '銀河機攻隊マジェスティックプリンス',       start_time: '22:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[3].id},
    {title: '銀の匙',                                   start_time: '01:00:00', channel_id: channels[6].id,  day_of_week_id: dayOfWeeks[4].id, point: 30},
    {title: 'ステラ女学院高等科C3部',                   start_time: '01:30:00', channel_id: channels[4].id,  day_of_week_id: dayOfWeeks[4].id},
    {title: 'ローゼンメイデン',                         start_time: '02:00:00', channel_id: channels[4].id,  day_of_week_id: dayOfWeeks[4].id},
#    {title: '帰宅部活動記録',                           start_time: '03:00:00', channel_id: channels[2].id,  day_of_week_id: dayOfWeeks[4].id},
#    {title: '電脳コイル(再)',                           start_time: '18:00:00', channel_id: channels[7].id,  day_of_week_id: dayOfWeeks[4].id},
    {title: '空の境界',                                 start_time: '00:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[5].id},
    {title: 'とある科学の超電磁砲S',                    start_time: '00:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[5].id},
#    {title: '超次元ゲームネプテューヌ',                 start_time: '01:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[5].id},
#    {title: 'Fate/kaleid liner プリズマ☆イリヤ',        start_time: '01:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[5].id},
    {title: 'ダンガンロンパ',                           start_time: '02:00:00', channel_id: channels[4].id,  day_of_week_id: dayOfWeeks[5].id},
    {title: '恋愛ラボ',                                 start_time: '02:30:00', channel_id: channels[4].id,  day_of_week_id: dayOfWeeks[5].id},
    {title: 'ガッチャマンクラウズ',                     start_time: '02:30:00', channel_id: channels[2].id,  day_of_week_id: dayOfWeeks[5].id, point: 30},
    {title: '団地ともお',                               start_time: '09:30:00', channel_id: channels[0].id,  day_of_week_id: dayOfWeeks[5].id, point: 20},
    {title: '宇宙兄弟',                                 start_time: '17:30:00', channel_id: channels[2].id,  day_of_week_id: dayOfWeeks[5].id},
#    {title: '幻影ヲ駆ケル太陽',                         start_time: '23:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[5].id},
    {title: '物語シリーズ2ndシーズン',                  start_time: '00:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'サーヴァント×サービス',                    start_time: '00:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'げんしけん2',                              start_time: '01:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
#    {title: '神さまのいない日曜日',                     start_time: '01:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: '仮面ライダー',                             start_time: '08:00:00', channel_id: channels[3].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'プリキュア',                               start_time: '08:30:00', channel_id: channels[3].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'トリコ',                                   start_time: '09:00:00', channel_id: channels[6].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'ONE PIECE',                                start_time: '09:30:00', channel_id: channels[6].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'Hunter×Hunter',                            start_time: '11:00:00', channel_id: channels[2].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: '宇宙戦艦ヤマト2199',                       start_time: '17:00:00', channel_id: channels[4].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: '新機動戦記ガンダムW',                      start_time: '19:00:00', channel_id: channels[11].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: '有頂天家族',                               start_time: '22:00:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: '進撃の巨人',                               start_time: '22:30:00', channel_id: channels[8].id,  day_of_week_id: dayOfWeeks[6].id},
    {title: 'SuperGT',                                  start_time: '23:30:00', channel_id: channels[5].id,  day_of_week_id: dayOfWeeks[6].id},
])
