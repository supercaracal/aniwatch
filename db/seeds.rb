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
    { title: 'ウマ娘', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: '食戟のソーマ 餐の皿', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: 'Cutie Honey Universe', start_time: '19:00:00', channel: ch9, day_of_week: mon },
    { title: 'ゴールデンカムイ', start_time: '23:00:00', channel: ch9, day_of_week: mon },
    { title: 'バジリスク桜花忍法帖', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: '蒼天の拳 REGENESIS', start_time: '00:30:00', channel: ch9, day_of_week: tue },
    { title: '宇宙戦艦ティラミス', start_time: '01:00:00', channel: ch9, day_of_week: tue },
    { title: 'あっくんとカノジョ', start_time: '01:10:00', channel: ch9, day_of_week: tue },
    { title: '踏切時間', start_time: '01:15:00', channel: ch9, day_of_week: tue },
    { title: 'レディスポ', start_time: '01:20:00', channel: ch9, day_of_week: tue },
    { title: '魔法少女 俺', start_time: '01:30:00', channel: ch9, day_of_week: tue },
    { title: 'ガンダムビルドダイバーズ', start_time: '18:00:00', channel: ch7, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: '東京喰種:re', start_time: '23:00:00', channel: ch9, day_of_week: tue },
    { title: '立花館To Lieあんぐる', start_time: '01:00:00', channel: ch9, day_of_week: wed },
    { title: '斉木楠雄のpsy難', start_time: '01:30:00', channel: ch7, day_of_week: wed },
    { title: 'ルパン三世Part5', start_time: '01:30:00', channel: ch4, day_of_week: wed },
    { title: 'BORUTO', start_time: '18:00:00', channel: ch7, day_of_week: wed },
    { title: 'ありすorありす', start_time: '22:30:00', channel: ch9, day_of_week: wed },
    { title: '重神機パンドーラ', start_time: '23:30:00', channel: ch9, day_of_week: wed },
    { title: 'シュタインズ・ゲート ゼロ', start_time: '01:30:00', channel: ch9, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: '銀河英雄伝説 Die Neue These', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: 'ひそねとまそたん', start_time: '00:00:00', channel: ch9, day_of_week: fri },
    { title: '奴隷区', start_time: '01:00:00', channel: ch9, day_of_week: fri },
    { title: 'メガロボクス', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: '覇穹 封神演義', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: 'フルメタル・パニック! Invisible Victory', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: 'グランクレスト戦記', start_time: '00:00:00', channel: ch9, day_of_week: sat },
    { title: '刀使ノ巫女', start_time: '01:00:00', channel: ch9, day_of_week: sat },
    { title: 'ヒナまつり', start_time: '01:30:00', channel: ch9, day_of_week: sat },
    { title: 'BEATLESS', start_time: '01:30:00', channel: ch6, day_of_week: sat },
    { title: '魔法少女サイト', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: '七つの大罪 戒めの復活', start_time: '06:30:00', channel: ch6, day_of_week: sat },
    { title: '僕のヒーローアカデミア', start_time: '17:30:00', channel: ch4, day_of_week: sat },
    { title: 'ダーリン・イン・ザ・フランキス', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'Sord Art Online Alternative Gun Gale Online', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'ペルソナ5', start_time: '00:30:00', channel: ch9, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
