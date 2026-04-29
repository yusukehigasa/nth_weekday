# nth_weekday

[![Gem Version](https://img.shields.io/gem/v/nth_weekday)](https://rubygems.org/gems/nth_weekday)
[![Build Status](https://github.com/yusukehigasa/nth_weekday/actions/workflows/test.yml/badge.svg)](https://github.com/yusukehigasa/nth_weekday/actions)

---

**🇯🇵 任意の年月から「第3水曜日」「最終金曜日」などを簡単に取得できる軽量Rubyライブラリです。Rails対応・外部依存ゼロ。**

**🇺🇸 A lightweight Ruby library to get dates like "3rd Wednesday" or "last Friday" from any given year and month. Rails-compatible and dependency-free.**

---

## ✨ Features / 特長

- 🎯 指定月の「第◯◯曜日」を簡単に取得
- 🔧 `:we`, `:fr` のような直感的な曜日指定
- ⚙️ Rubyのみで動作、ActiveSupport不要
- ✅ Rails / Sinatra / CLI / バッチ対応
- 🧪 テスト済み、CI/CD導入しやすい構成

## 💎 Installation / インストール

```bash
# Gemfileに追加
gem 'nth_weekday'

# または直接インストール
gem install nth_weekday
```

## 💻 Requirements / 動作環境

- Ruby 3.3.0以上
- CI verified on Ruby 3.3.0 and Ruby 4.0.1

## 🚀 Usage / 使い方

```ruby
require 'nth_weekday'

# 第3水曜日（2025年4月）
NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: 3)
# => #<Date: 2025-04-16>

# 最後の金曜日（2025年12月）
NthWeekday.get(year: 2025, month: 12, weekday: :fr, nth: -1)
# => #<Date: 2025-12-26>

# 日付文字列として取得
NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: 3, format: '%Y-%m-%d')
# => "2025-04-16"

# UNIXタイムスタンプとして取得（UTC 00:00:00基準）
NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: 3, format: :unix)
# => 1744761600
```

## 📘 Parameters / パラメータ

| パラメータ名 | 型                    | 説明                                                  |
|--------------|-----------------------|-------------------------------------------------------|
| `year`       | Integer               | 対象年（例: 2025）                                   |
| `month`      | Integer               | 対象月（1〜12）                                       |
| `weekday`    | Symbol                | 対象曜日（`:su`, `:mo`, `:tu`, `:we`, `:th`, `:fr`, `:sa`）      |
| `nth`        | Integer               | 第n◯曜日。1〜5、または `-1` で「最後の◯曜日」を指定 |
| `format`     | String, Symbol, nil   | 省略可。`String` は `Date#strftime` 形式、`:unix` は UTC 00:00:00 基準の UNIX タイムスタンプ |

`format` を省略した場合は、従来通り `Date` オブジェクトを返します。

### 曜日シンボル一覧
- `:su` - 日曜日 (Sunday)
- `:mo` - 月曜日 (Monday)
- `:tu` - 火曜日 (Tuesday)
- `:we` - 水曜日 (Wednesday)
- `:th` - 木曜日 (Thursday)
- `:fr` - 金曜日 (Friday)
- `:sa` - 土曜日 (Saturday)

## 🧪 Example: 2025年の各月の第3水曜日を取得

```ruby
(1..12).each do |month|
  date = NthWeekday.get(year: 2025, month: month, weekday: :we, nth: 3)
  puts "2025年#{month}月 第3水曜日: #{date}"
end
```

## 📦 Development / 開発者向け

```bash
git clone https://github.com/yusukehigasa/nth_weekday.git
cd nth_weekday
bundle install
bundle exec rspec  # テスト実行
bundle exec rubocop  # コードスタイルチェック
```

このプロジェクトでは [RuboCop](https://rubocop.org/) を使用してコードスタイルを一貫して維持しています。コード変更時は `bundle exec rubocop` でスタイルチェックを実行してください。

エージェント運用時のルールは以下を参照してください。

## 🤖 AI / Agent Development Modes

このリポジトリは AI エージェントによる開発を前提に、2つのモードをサポートしています。

### 🧩 通常モード（Single Agent）

単一エージェントによる高速な実装。

**用途**
- 小規模修正
- 明確なタスク

---

### 🧠 オーケストレーターモード（Multi-Agent）

複数の役割エージェントによる段階的開発。

**フロー**
1. Issue
2. Plan
3. Implementation
4. Review
5. PR

**用途**
- 複雑な変更
- 設計が必要なタスク

## 🧭 Mode Selection

| ケース | モード |
| :-- |:-- |
| 小規模な変更・新規機能 | 通常 |
| 複雑な変更・大規模な新規機能 | オーケストレーター |

---

## 📚 Docs

- [AGENTS.md](./AGENTS.md)
- [CODING_RULES.md](./CODING_RULES.md)
- [HUMAN_IN_THE_LOOP.md](./HUMAN_IN_THE_LOOP.md)

## 👥 Contributing / 貢献

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -am 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Create a new Pull Request

バグ報告や機能要望は[GitHub Issues](https://github.com/yusukehigasa/nth_weekday/issues)にお願いします。

## 📄 License

- MIT License

## 🙌 Author

- [Yusuke Higasa](https://github.com/yusukehigasa)

## 🔗 Links

-	[RubyGems - nth_weekday](https://rubygems.org/gems/nth_weekday)
-	[GitHub Repository](https://github.com/yusukehigasa/nth_weekday)
-	[Changelog](https://github.com/yusukehigasa/nth_weekday/blob/main/CHANGELOG.md)
