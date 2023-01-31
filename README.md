# Flutter Sample

Flutter のサンプル

```
flutter run
```

## demo

demo(web)

## design

![デザイン](https://github.com/bokotomo/flutter-sample/blob/main/docs/images/gamerreflection_design_img_thumb.jpg?raw=true)

## database

```
// create database
```

## test

```
// test
```

# 仕様

## ページ遷移

```
root
├── Register Reflection Name（振り返り名の追加）
├── Task（タスク一覧）
│ ├── Task Detail（タスク詳細と振り返り追加/編集と完了）
├── Add Reflection（振り返りの追加）
├── Ranking（ランキング, 自身の状況, 他ユーザーのランキング）
│ ├── Ranking History（ランキングや自身の履歴）
├── Account Setting（アカウント設定, 編集もここで可能）
│ ├── Register Reflection Name（振り返り名の追加）
```

### ページ遷移 - メモ

- ログイン不要のツールなのでログアウトはない。
- ユーザビリティを考えた結果、編集画面への遷移は少なくそのページでできる。

### ページ遷移 - ユーザー価値優先順位

優先順位の高いものから実装と検証を行う。

- 1. Add Reflection, Task, Task Detail, Register Reflection Name
- 2. Ranking
- 3. Account Setting
