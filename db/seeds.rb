# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

_1ch =  Channel.create({name: 'NHK総合',      code: '1ch'}).id
_2ch =  Channel.create({name: 'Eテレ',        code: '2ch'}).id
_4ch =  Channel.create({name: '日本テレビ',   code: '4ch'}).id
_5ch =  Channel.create({name: 'テレビ朝日',   code: '5ch'}).id
_6ch =  Channel.create({name: 'TBSテレビ',    code: '6ch'}).id
_7ch =  Channel.create({name: 'テレビ東京',   code: '7ch'}).id
_8ch =  Channel.create({name: 'フジテレビ',   code: '8ch'}).id
_9ch =  Channel.create({name: 'TOKYO MX',     code: '9ch'}).id
_3ch =  Channel.create({name: 'テレ玉',       code: '10ch'}).id
_BS3 =  Channel.create({name: 'BSプレミアム', code: 'BS3'}).id
_BS8 =  Channel.create({name: 'BSフジ',       code: 'BS8'}).id
_BS11 = Channel.create({name: 'BS11',         code: 'BS11'}).id

月 = DayOfWeek.create({name: '月', code: 'mon'}).id
火 = DayOfWeek.create({name: '火', code: 'tue'}).id
水 = DayOfWeek.create({name: '水', code: 'wed'}).id
木 = DayOfWeek.create({name: '木', code: 'thu'}).id
金 = DayOfWeek.create({name: '金', code: 'fri'}).id
土 = DayOfWeek.create({name: '土', code: 'sat'}).id
日 = DayOfWeek.create({name: '日', code: 'sun'}).id

Lineup.create([
    {title: 'TOP GEAR',                                           start_time: '23:00:00', channel_id: _BS8,  day_of_week_id: 月},
    {title: '機巧少女は傷つかない',                               start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 火},
    {title: '弱虫ペダル',                                         start_time: '01:30:00', channel_id: _7ch,  day_of_week_id: 火},
    {title: 'のんのんびより',                                     start_time: '02:00:00', channel_id: _7ch,  day_of_week_id: 火},
    {title: '東京レイヴンズ',                                     start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 水},
    {title: 'BLAZBLUE',                                           start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 水},
    {title: 'HUBTER×HUNTER',                                      start_time: '01:30:00', channel_id: _4ch,  day_of_week_id: 水},
    {title: '探検バクモン',                                       start_time: '22:50:00', channel_id: _1ch,  day_of_week_id: 水},
    {title: '境界の彼方',                                         start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 木},
    {title: '俺の脳内選択肢が、学園ラブコメを全力で邪魔している', start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 木},
    {title: '京騒戯画',                                           start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 木},
    {title: 'ポケモン',                                           start_time: '19:00:00', channel_id: _7ch,  day_of_week_id: 木},
    {title: 'NARUTO疾風伝',                                       start_time: '19:30:00', channel_id: _7ch,  day_of_week_id: 木},
    {title: '蒼き鋼のアルペジオ',                                 start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 木},
    {title: '凧のあすから',                                       start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 木},
    {title: 'ガリレイドンナ',                                     start_time: '01:00:00', channel_id: _8ch,  day_of_week_id: 金},
    {title: 'サムライフラメンコ',                                 start_time: '01:30:00', channel_id: _8ch,  day_of_week_id: 金},
    {title: 'アウトブレイクカンパニー',                           start_time: '01:30:00', channel_id: _6ch,  day_of_week_id: 金},
    {title: 'インフィニットストラトス2',                          start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 金},
    {title: 'COPPELION',                                          start_time: '23:30:00', channel_id: _BS11,  day_of_week_id: 金},
    {title: 'ストライクザブラッド',                               start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 土},
    {title: '勇者になれなかった俺はしぶしぶ就職を決意しました。', start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 土},
    {title: '革命機ヴァルヴレイヴ2',                              start_time: '02:00:00', channel_id: _6ch,  day_of_week_id: 土},
    {title: 'キルラキル',                                         start_time: '02:30:00', channel_id: _6ch,  day_of_week_id: 土},
    {title: '団地ともお',                                         start_time: '09:00:00', channel_id: _1ch,  day_of_week_id: 土},
    {title: '宇宙兄弟',                                           start_time: '17:30:00', channel_id: _4ch,  day_of_week_id: 土},
    {title: 'ログホライズン',                                     start_time: '17:30:00', channel_id: _2ch,  day_of_week_id: 土},
    {title: 'リトルバスターズ2',                                  start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 土},
    {title: '物語シリーズ2ndシーズン',                            start_time: '00:00:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: 'ゴールデンタイム',                                   start_time: '01:00:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: 'White Album2',                                       start_time: '01:30:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: '仮面ライダー',                                       start_time: '08:00:00', channel_id: _5ch,  day_of_week_id: 日},
    {title: 'プリキュア',                                         start_time: '08:30:00', channel_id: _5ch,  day_of_week_id: 日},
    {title: 'トリコ',                                             start_time: '09:00:00', channel_id: _8ch,  day_of_week_id: 日},
    {title: 'ワンピース',                                         start_time: '09:30:00', channel_id: _8ch,  day_of_week_id: 日},
    {title: 'マギ2',                                              start_time: '17:00:00', channel_id: _6ch,  day_of_week_id: 日},
    {title: 'ファイブレイン3',                                    start_time: '17:30:00', channel_id: _2ch,  day_of_week_id: 日},
    {title: 'ガンダムビルドファイターズ3',                        start_time: '19:00:00', channel_id: _BS11,  day_of_week_id: 日},
    {title: '世界で一番強くなりたい',                             start_time: '22:00:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: 'ラブライブ(再)',                                     start_time: '22:30:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: '夜桜四重奏ハナノウタ',                               start_time: '23:30:00', channel_id: _9ch,  day_of_week_id: 日},
    {title: 'SuperGT',                                            start_time: '23:30:00', channel_id: _7ch,  day_of_week_id: 日},
    {title: 'ワルキューレロマンツェ',                             start_time: '00:30:00', channel_id: _9ch,  day_of_week_id: 月},
    {title: 'ぎんぎつね',                                         start_time: '01:00:00', channel_id: _7ch,  day_of_week_id: 月},
    {title: 'お願いティーチャー(再)',                             start_time: '01:00:00', channel_id: _3ch,  day_of_week_id: 月},
    {title: 'DNA2(再)',                                           start_time: '01:45:00', channel_id: _3ch,  day_of_week_id: 月},
])
