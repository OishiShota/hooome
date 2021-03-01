# アプリケーション名
## hooome
<br>

# 概要
## 掲示板アプリケーション
- アカウント作成
- 掲示板の閲覧
- 掲示板の作成 (ログイン時のみ)
- 掲示板へのメッセージ投稿 (ログイン時のみ)
- 掲示板へのpngまたはjpeg画像投稿 (ログイン時のみ)
- 掲示板の検索 <br>
  (ヘッダーの検索欄にキーワードを入力)
- アカウントID検索 <br>
  (ヘッダーの検索欄に@から始まるアカウントIDを入力)
- マイページ、ユーザーページの閲覧
<br><br>

## 開発期間と平均作業時間
- 2/15~2/26
- 1日あたりの平均作業時間: 6時間程度
- 合計: 60時間程度
<br><br>

# 本番環境
## 接続先情報
- https://hooome-19960606.herokuapp.com/
- ID/Pass
  - ID: admin
  - Pass: 2222
- テスト用アカウント
  - アカウント1
    - メールアドレス: test@1
    - パスワード: test01
  - アカウント2
    - メールアドレス: test@2
    - パスワード: test02
<br><br>

## Githubリポジトリ
- https://github.com/OishiShota/hooome

# 制作背景
## 匿名性の高いSNSの作成
- 現在の主要SNSは現実の延長線上のものになり、従来の匿名コミュニケーションが行いにくくなっている
- 現実からの開放を求めSNSを行なっていたユーザーの新たなプラットホームを作成を行いたい
<br><br>

## ペルソナ
- 年齢: 30代前後
- 性別: 主に男性
- 職業: 平日に働く一般会社員
- 趣味: 無趣味
<br><br>

# DEMO

# 工夫した点
- 自分が作成した掲示板をリスト化
- 自分がコメントした掲示板のリスト化
- 掲示板作成順だけでなく掲示板更新順にリスト化
<br><br>

# 開発環境・使用技術
## 開発環境
- HTML/CSS/JavaScript/Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code
<br><br>

## 使用技術
- HTML・CSSによるレイアウト作成
- Ruby/Ruby on Railsによるwebアプリケーションの作成
- JavaScriptによるメッセージ投稿時文字数カウント
- Active Storageによる画像アップロード
- Githubによる開発データ管理
- SQLによる掲示板並び替え・条件表示およびユーザー検索
<br><br>

# 課題
- ユーザー情報変更の実装
- コメント投稿内容でのキーワード検索機能の実装
- 掲示板閲覧履歴の実装
- 掲示板お気に入り機能
- 動画、ファイル投稿の実装
<br><br>

# DB設計
## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| address            | string | null: false, unique: true |

### Association
- has_many :homes
- has_many :messages
<br><br>

## homes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :messages
<br><br>

## message テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :home
- belongs_to :user