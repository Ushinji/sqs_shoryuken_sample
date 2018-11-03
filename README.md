
# 開発環境

## 必要環境

* Git
* Docker

## リポジトリのクローン

```
$ git clone git@github.com:Ushinji/sqs_shoryuken_sample.git
$ cd path/to/repo
```


## 起動手順

イメージのビルド

```
docker-compose build
```

bundle install

```
docker-compose exec --rm app bundle install
```

DBマイグレーション

```
docker-compose exec --rm app bundle exec rails db:create

docker-compose exec --rm app bundle exec rails db:migrate
```

コンテナー起動

```
docker-compose up -d
```

http://localhost:3000 にアクセスして、アプリが表示されることを確認。


## キューメッセージを送信してみる

```
docker-compose exec app rake sample:enque
```

# Memo
* productionを意識したコードを書いていますが、productionでは動きません。
* 