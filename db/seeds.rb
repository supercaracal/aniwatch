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
    { title: 'はねバド!', start_time: '00:00:00', channel: ch9, day_of_week: mon },
    { title: 'バキ', start_time: '00:30:00', channel: ch9, day_of_week: mon },
    { title: '進撃の巨人', start_time: '00:30:00', channel: ch1, day_of_week: mon },
    { title: '銀魂', start_time: '01:30:00', channel: ch7, day_of_week: mon },
    { title: '幽遊白書', start_time: '19:00:00', channel: ch9, day_of_week: mon },
    { title: 'あっくんとカノジョ', start_time: '01:00:00', channel: ch9, day_of_week: tue },
    { title: '邪神ちゃんドロップキック', start_time: '01:05:00', channel: ch9, day_of_week: tue },
    { title: 'ガンダムビルドダイバーズ', start_time: '18:00:00', channel: ch7, day_of_week: tue },
    { title: 'ブラッククローバー', start_time: '18:30:00', channel: ch7, day_of_week: tue },
    { title: 'アイドルマスターシンデレラガールズ劇場', start_time: '21:55:00', channel: ch9, day_of_week: tue },
    { title: 'オーバーロードIII', start_time: '00:30:00', channel: ch9, day_of_week: wed },
    { title: 'ルパン三世Part5', start_time: '01:30:00', channel: ch4, day_of_week: wed },
    { title: '中間管理録トネガワ', start_time: '02:00:00', channel: ch4, day_of_week: wed },
    { title: '重神機パンドーラ', start_time: '23:30:00', channel: ch9, day_of_week: wed },
    { title: 'Free! Dive to the future', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'アンゴルモア元寇合戦記', start_time: '01:00:00', channel: ch9, day_of_week: thu },
    { title: 'シュタインズ・ゲート ゼロ', start_time: '01:30:00', channel: ch9, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: 'BORUTO', start_time: '19:30:00', channel: ch7, day_of_week: thu },
    { title: '異世界魔王と召喚少女の奴隷魔術', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: 'すのはら荘の管理人さん', start_time: '22:30:00', channel: ch9, day_of_week: thu },
    { title: '天狼 Sirius the Jaeger', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: 'BANANA FISH', start_time: '01:00:00', channel: ch8, day_of_week: fri },
    { title: '少女☆歌劇 レヴュースタァライト', start_time: '01:30:00', channel: ch6, day_of_week: fri },
    { title: '七星のスバル', start_time: '02:00:00', channel: ch6, day_of_week: fri },
    { title: 'ちおちゃんの通学路', start_time: '22:00:00', channel: ch9, day_of_week: fri },
    { title: '殺戮の天使', start_time: '22:30:00', channel: ch9, day_of_week: fri },
    { title: 'ハイスコアガール', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'ロードオブヴァーミリオン', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: 'はるかなレシーブ', start_time: '01:40:00', channel: ch9, day_of_week: sat },
    { title: 'ハッピーシュガーライフ', start_time: '02:00:00', channel: ch6, day_of_week: sat },
    { title: 'ぐらんぶる', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: '僕のヒーローアカデミア', start_time: '17:30:00', channel: ch4, day_of_week: sat },
    { title: 'ゆらぎ荘の幽奈さん', start_time: '23:30:00', channel: ch9, day_of_week: sat },
    { title: 'はたらく細胞', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: 'ペルソナ5', start_time: '00:30:00', channel: ch9, day_of_week: sun },
    { title: '百錬の覇王と聖約の戦乙女', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'ゲゲゲの鬼太郎', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: 'ISLAND', start_time: '22:00:00', channel: ch9, day_of_week: sun },
    { title: 'プラネット・ウィズ', start_time: '22:30:00', channel: ch9, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
