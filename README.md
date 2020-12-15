### アプリケーション名  
 「リクエスト・シェフ」

### アプリケーション概要
 料理を作って欲しい人と、料理を作りたい人をマッチングするアプリケーションです。

### URL
 https://request-chef.herokuapp.com/

### テスト用アカウント
 メールアドレス： y@y  
 パスワード : yyyyyy1  
  
### 利用方法
 シェフ側：新規登録をして、「シェフさん新規登録」にて、自身のプロフィールなどを登録します。  
 ユーザー側: トップページにて、シェフさん一覧より依頼したいシェフさんの詳細ページへ遷移し、内容を確認します。その後、依頼ページ遷移し、クレジットカード情報、依頼者の住所などを登録したら依頼ができます。

### 目指した課題解決
 調理技術を持ったシェフがそのスキルを生かして収益をあげる事と、ご自宅でそのスキルを生かして自分のために料理をして欲しいという、ユーザーのニーズを満たすことを目指しました。
 

### 洗い出した要件定義

| 優先順位(高:3 中:2 低:1)            | 機能     | 目的     | 詳細      | ストーリー（ユースケース)| 見積もり(所要時間)| 
| - | - | - | - | - | -
|      3      | DB設計   | アプリ作成の全体全体像を把握する必要テーブルを洗い出す | 必要テーブル users/chefs/requests/addresses | | 5 | 
|     ３        | ユーザー管理機能    | deviceを用いたユーザー管理機能 | トップページ右上にログイン、新規録ボタンを表示させる。ログイン時は、ログアウトボタンを表示   |  シェフに依頼したいユーザーは、ログインもしくは新規登録をする必要がある| 5  |
|      ３      |  シェフ一覧表示機能  | ユーザーに、利用したいシェフの一覧で選びやすくするため | 登録一覧には、写真、ニックネーム得意料理のカテゴリ、料金を表示させる  | シェフ一覧表示から、条件に合うシェフを選択する。シェフ写真から詳細情報へ遷移する|4
 3  |	シェフ新規登録機能| シェフとしてのスキルを生かしたい人のアピールの場 | 登録ページには、シェフ自身の写真、ニックネーム、得意料理のカテゴリー、出張可能エリア、出張可能時間帯、料金を入力してもらう|  一覧ページの「シェフ新規登録」からシェフの情報を登録する | 4
３|  シェフ情報編集|  登録シェフの情報を更新しやすくする| 登録ページ同様、シェフ自身の写真、ニックネーム、得意料理のカテゴリー、出張可能エリア、出張可能時間帯、料金を入力してもらう|  ログインかつ登録した本人は自身の登録情報の更新ができる|  3 
|       3           |  シェフ情報削除機能   |	     登録シェフの情報を削除するため          |	     登録シェフの情報をDBから削除する         |	ログインかつ登録した本人は、自身の登録情報の削除ができる    | 3 
|  	 	 ３            |  依頼料金支払い機能  |  クレジットカードを用いた支払い機能を実装する  | 依頼をして、支払いを完了するまでの機能を実装する   | 詳細ページの「依頼するボタン」をクリックしたら、DB及びPAY.JPサイトに依頼したシェフの情報が更新される |  10 
|  2   | 複数画像投稿機能   |   シェフのこれまで作ってきた料理の写真を複数載せるため  | 	シェフ詳細ページにて、イメージ料理の写真を 載せる事ができる | シェフは、自身の料理の写真を複数詳細ページにて複数載せらる。ユーザーは、シェフ詳細ページにてシェフの料理一覧を閲覧する事ができる   | 5 
|  2 |	 レビュー評価機能     |	シェフとお客さんとが互いに評価できるようにするため | 実際にサービスを受けたお客さんからのフィードバックをもらいやすくする |	シェフは依頼者を、依頼者はシェフをサービス  提供後に評価する |  5
 |  1    |  	検索機能 | ユーザーが条件に合うシェフを探しやすくするため	|  検索窓を用意。キーワード入力で検索可能にする |	ユーザーは検索窓からキーワードを入力して自分の条件にあうシェフを見つけやすくする|        3  

## users テーブル
| Column            | Type     | Options     |
| ----------------- | -------- | ----------- |
| nickname          | string   | null: false |
| email             | string   | null: false |
| password          | string   | null: false |

### Association

- has_many :chefs
- has_many  :requests

## chefs テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| nickname        | string     | null: false                    |
| profile         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| area            | string     | null: false                    |
| fee_time_id     | integer    | null: false                    | 
| price           | integer    | null: false                    |


### Association

- belongs_to :user
- has_many   :photos
- has_one    :request

## photos テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| chefs           | references | foreign_key: true              |

### Association
- belongs_to :chef

## requests_chef テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| chef                | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :chef
 - has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| request_chef  | references | null: false, foreign_key: true |
| postal_code   | string     | null: false, foreign_key: true |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |


### Association

- belongs_to :request_chef