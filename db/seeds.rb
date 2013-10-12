# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

_1ch =  Channel.create({name: 'NHK総合',      code: '1ch'})
_2ch =  Channel.create({name: 'Eテレ',        code: '2ch'})
_4ch =  Channel.create({name: '日本テレビ',   code: '4ch'})
_5ch =  Channel.create({name: 'テレビ朝日',   code: '5ch'})
_6ch =  Channel.create({name: 'TBSテレビ',    code: '6ch'})
_7ch =  Channel.create({name: 'テレビ東京',   code: '7ch'})
_8ch =  Channel.create({name: 'フジテレビ',   code: '8ch'})
_3ch =  Channel.create({name: 'テレ玉',       code: '3ch'})
_9ch =  Channel.create({name: 'TOKYO MX',     code: '9ch'})
_BS3 =  Channel.create({name: 'BSプレミアム', code: 'BS3'})
_BS8 =  Channel.create({name: 'BSフジ',       code: 'BS8'})
_BS11 = Channel.create({name: 'BS11',         code: 'BS11'})

月 = DayOfWeek.create({name: '月', code: 'mon'})
火 = DayOfWeek.create({name: '火', code: 'tue'})
水 = DayOfWeek.create({name: '水', code: 'wed'})
木 = DayOfWeek.create({name: '木', code: 'thu'})
金 = DayOfWeek.create({name: '金', code: 'fri'})
土 = DayOfWeek.create({name: '土', code: 'sat'})
日 = DayOfWeek.create({name: '日', code: 'sun'})

Lineup.create([
    {title: 'TOP GEAR',                                           start_time: '23:00:00', channel_id: _BS8.id,  day_of_week_id: 月.id},
    {title: '機巧少女は傷つかない',                               start_time: '00:30:00', channel_id: _9ch.id,  day_of_week_id: 火.id},
    {title: '弱虫ペダル',                                         start_time: '01:30:00', channel_id: _7ch.id,  day_of_week_id: 火.id},
    {title: 'のんのんびより',                                     start_time: '02:00:00', channel_id: _7ch.id,  day_of_week_id: 火.id},
    {title: '東京レイヴンズ',                                     start_time: '00:30:00', channel_id: _9ch.id,  day_of_week_id: 水.id},
    {title: 'BLAZBLUE',                                           start_time: '01:30:00', channel_id: _9ch.id,  day_of_week_id: 水.id},
    {title: 'HUBTER×HUNTER',                                      start_time: '01:30:00', channel_id: _4ch.id,  day_of_week_id: 水.id},
    {title: '探検バクモン',                                       start_time: '22:50:00', channel_id: _1ch.id,  day_of_week_id: 水.id},
    {title: '境界の彼方',                                         start_time: '00:30:00', channel_id: _9ch.id,  day_of_week_id: 木.id},
    {title: '俺の脳内選択肢が、学園ラブコメを全力で邪魔している', start_time: '01:00:00', channel_id: _9ch.id,  day_of_week_id: 木.id},
    {title: '京騒戯画',                                           start_time: '01:30:00', channel_id: _9ch.id,  day_of_week_id: 木.id},
    {title: 'ポケモン',                                           start_time: '19:00:00', channel_id: _7ch.id,  day_of_week_id: 木.id},
    {title: 'NARUTO疾風伝',                                       start_time: '19:30:00', channel_id: _7ch.id,  day_of_week_id: 木.id},
    {title: '蒼き鋼のアルペジオ',                                 start_time: '22:00:00', channel_id: _9ch.id,  day_of_week_id: 木.id},
    {title: '凧のあすから',                                       start_time: '22:30:00', channel_id: _9ch.id,  day_of_week_id: 木.id},
    {title: 'ガリレイドンナ',                                     start_time: '01:00:00', channel_id: _8ch.id,  day_of_week_id: 金.id},
    {title: 'サムライフラメンコ',                                 start_time: '01:30:00', channel_id: _8ch.id,  day_of_week_id: 金.id},
    {title: 'アウトブレイクカンパニー',                           start_time: '01:30:00', channel_id: _6ch.id,  day_of_week_id: 金.id},
    {title: 'インフィニットストラトス2',                          start_time: '02:00:00', channel_id: _6ch.id,  day_of_week_id: 金.id},
    {title: 'COPPELION',                                          start_time: '23:30:00', channel_id: _BS11.id,  day_of_week_id: 金.id},
    {title: 'ストライクザブラッド',                               start_time: '00:30:00', channel_id: _9ch.id,  day_of_week_id: 土.id},
    {title: '勇者になれなかった俺はしぶしぶ就職を決意しました。', start_time: '01:30:00', channel_id: _9ch.id,  day_of_week_id: 土.id},
    {title: '革命機ヴァルヴレイヴ2',                              start_time: '02:00:00', channel_id: _6ch.id,  day_of_week_id: 土.id},
    {title: 'キルラキル',                                         start_time: '02:30:00', channel_id: _6ch.id,  day_of_week_id: 土.id},
    {title: '団地ともお',                                         start_time: '09:00:00', channel_id: _1ch.id,  day_of_week_id: 土.id},
    {title: '宇宙兄弟',                                           start_time: '17:30:00', channel_id: _4ch.id,  day_of_week_id: 土.id},
    {title: 'ログホライズン',                                     start_time: '17:30:00', channel_id: _2ch.id,  day_of_week_id: 土.id},
    {title: 'リトルバスターズ2',                                  start_time: '22:30:00', channel_id: _9ch.id,  day_of_week_id: 土.id},
    {title: '物語シリーズ2ndシーズン',                            start_time: '00:00:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: 'ゴールデンタイム',                                   start_time: '01:00:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: 'White Album2',                                       start_time: '01:30:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: '仮面ライダー',                                       start_time: '08:00:00', channel_id: _5ch.id,  day_of_week_id: 日.id},
    {title: 'プリキュア',                                         start_time: '08:30:00', channel_id: _5ch.id,  day_of_week_id: 日.id},
    {title: 'トリコ',                                             start_time: '09:00:00', channel_id: _8ch.id,  day_of_week_id: 日.id},
    {title: 'ワンピース',                                         start_time: '09:30:00', channel_id: _8ch.id,  day_of_week_id: 日.id},
    {title: 'マギ2',                                              start_time: '17:00:00', channel_id: _6ch.id,  day_of_week_id: 日.id},
    {title: 'ファイブレイン3',                                    start_time: '17:30:00', channel_id: _2ch.id,  day_of_week_id: 日.id},
    {title: 'ガンダムビルドファイターズ3',                        start_time: '19:00:00', channel_id: _BS11.id,  day_of_week_id: 日.id},
    {title: '世界で一番強くなりたい',                             start_time: '22:00:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: 'ラブライブ(再)',                                     start_time: '22:30:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: '夜桜四重奏ハナノウタ',                               start_time: '23:30:00', channel_id: _9ch.id,  day_of_week_id: 日.id},
    {title: 'SuperGT',                                            start_time: '23:30:00', channel_id: _7ch.id,  day_of_week_id: 日.id},
    {title: 'ワルキューレロマンツェ',                             start_time: '00:30:00', channel_id: _9ch.id,  day_of_week_id: 月.id},
    {title: 'ぎんぎつね',                                         start_time: '01:00:00', channel_id: _7ch.id,  day_of_week_id: 月.id},
    {title: 'お願いティーチャー(再)',                             start_time: '01:00:00', channel_id: _3ch.id,  day_of_week_id: 月.id},
])
