# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Course.delete_all

user = User.create(name: 'mktakuya', password: 'ahiruchan')
user.token = User.generate_token
user.save

Course.create(
  name: '創造工学Ⅲ',
  code: '0015',
  credit: 2,
  instructor: '三上 剛,中村 嘉彦',
  content: '自身の専門分野にとどまらず，幅広い視点から問題解決のためのプロセスを立案し，チームワークによって実践する。また、キャリア形成に必要な能力や態度を身に付ける。'
)

Course.create(
  name: '回路理論Ⅰ',
  code: '0016',
  credit: 2,
  instructor: '稲川 清',
  content: '工学の基礎としての電気・電子工学に関する科目を学ぶ上で，電気回路の取り扱いに関する手法や知識，および線形回路システムとしての考え方・取り扱い方は，重要である。本講義では，直流回路の基礎事項と諸法則，交流回路の複素数表示・フェーザ表示による扱い方，交流回路の基礎事項と諸特性について講義する。'
)

Course.create(
  name: '論理回路Ⅱ',
  code: '0017',
  credit: 1,
  instructor: '大西 孝臣',
  content: 'コンピュータを構成する論理回路のうち、記憶素子が伴う順序論理回路を扱う。前年度教授した基本構成要素である記憶素子フリップフロップの機能に基づいている順序論理回路の応用回路となるシフトレジスタ・カウンタと、一般的な順序論理回路の設計について教授する。'
)

Course.create(
  name: 'プログラミングⅡ',
  code: '0018',
  credit: 2,
  instructor: '原田 恵雨',
  content: 'プログラミングⅡでは，より高度なプログラミング概念とその技法を修得する．'
)

Course.create(
  name: '計算機システム',
  code: '0019',
  credit: 2,
  instructor: '阿部 司',
  content: '計算機アーキテクチャのハードウェア技術と構造・構成、関連するソフトウェア技術を学習する。'
)

Course.create(
  name: 'ソフトウェアデザイン演習Ⅰ',
  code: '0020',
  credit: 1,
  instructor: '原田 恵雨',
  content: '「ソフトウェアデザイン演習Ⅰ」では，データ構造とアルゴリズムに焦点を充てる。'
)

Course.create(
  name: '情報科学・工学実験Ⅱ',
  code: '0021',
  credit: 3,
  instructor: '三上 剛,中村 嘉彦',
  content: ''
)

Course.create(
  name: '電子工学',
  code: '0030',
  credit: 1,
  instructor: '稲川 清',
  content: ''
)
