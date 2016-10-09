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
    { title: '斉木楠雄のΨ難', start_time: '02:00:00', channel: ch7, day_of_week: mon },
    { title: '魔法少女育成計画', start_time: '00:00:00', channel: ch9, day_of_week: tue },
    { title: '灼熱の卓球娘', start_time: '01:30:00', channel: ch7, day_of_week: tue },
    { title: '侍霊演武将星乱', start_time: '18:30:00', channel: ch9, day_of_week: tue },
    { title: '装神少女まとい', start_time: '23:00:00', channel: ch9, day_of_week: tue },
    { title: '双星の陰陽師', start_time: '18:30:00', channel: ch7, day_of_week: wed },
    { title: 'CHEATING CRAFT/TO BE HERO', start_time: '18:30:00', channel: ch9, day_of_week: wed },
    { title: '響けユーフォニアム2', start_time: '00:00:00', channel: ch9, day_of_week: thu },
    { title: 'ブレイブウィッチーズ', start_time: '01:30:00', channel: ch9, day_of_week: thu },
    { title: 'ユーリ!!! on ICE', start_time: '02:30:00', channel: ch5, day_of_week: thu },
    { title: 'ポケモン', start_time: '19:00:00', channel: ch7, day_of_week: thu },
    { title: 'NARUTO疾風伝', start_time: '19:30:00', channel: ch7, day_of_week: thu },
    { title: 'フリップフラッパーズ', start_time: '22:00:00', channel: ch9, day_of_week: thu },
    { title: '競女!!!!!!!!', start_time: '23:30:00', channel: ch9, day_of_week: thu },
    { title: '私がモテてどうすんだ', start_time: '02:00:00', channel: ch6, day_of_week: fri },
    { title: 'ガーリッシュナンバー', start_time: '02:30:00', channel: ch6, day_of_week: fri },
    { title: 'DRIFTERS', start_time: '23:00:00', channel: ch9, day_of_week: fri },
    { title: 'ジョジョの奇妙な冒険 ダイヤモンドは砕けない', start_time: '00:30:00', channel: ch9, day_of_week: sat },
    { title: '亜人', start_time: '02:30:00', channel: ch6, day_of_week: sat },
    { title: 'Bloodivores', start_time: '21:00:00', channel: ch9, day_of_week: sat },
    { title: 'ブブキ・ブランキ 星の巨人', start_time: '22:00:00', channel: ch9, day_of_week: sat },
    { title: 'ろんぐらいだぁす!', start_time: '22:30:00', channel: ch9, day_of_week: sat },
    { title: '3月のライオン', start_time: '23:00:00', channel: ch1, day_of_week: sat },
    { title: 'Occultic;Nine', start_time: '00:00:00', channel: ch9, day_of_week: sun },
    { title: '終末のイゼッタ', start_time: '01:30:00', channel: ch9, day_of_week: sun },
    { title: 'うどんの国の金色毛鞠', start_time: '02:15:00', channel: ch4, day_of_week: sun },
    { title: 'ドラゴンボール超', start_time: '09:00:00', channel: ch8, day_of_week: sun },
    { title: 'ワンピース', start_time: '09:30:00', channel: ch8, day_of_week: sun },
    { title: '機動戦士ガンダム 鉄血のオルフェンズ', start_time: '17:00:00', channel: ch6, day_of_week: sun },
    { title: 'SuperGT', start_time: '23:30:00', channel: ch7, day_of_week: sun }
  ]
)
