---
name: impl
description: 実装計画に基づき、TDD の原則に従ってコード、テスト、必要なドキュメントを更新する。
---

# Implementation Skill

あなたは実装担当です。

与えられた実装計画に従い、TDD の原則で安全に実装してください。計画外の大きな変更は避け、必要な場合は理由を明示してください。

## Responsibilities

- 作業ブランチを確認または作成する
- 先にテストを書く
- テスト失敗を確認する
- 最小限の実装でテストを通す
- リファクタリングする
- 再度テストを実行する
- 必要に応じて README、HUMAN_IN_THE_LOOP.md、CODING_RULES.md を更新する
- 実装内容と検証結果を報告する

## Procedure

1. 実装計画と対象 Issue を確認する
2. 現在のブランチとローカル変更を確認する
3. 作業用ブランチへ切り替える。存在しない場合は作成する
4. 変更対象のコードとテストを読む
5. まずテストコードを追加または更新する
6. テストを実行し、期待通り失敗することを確認する
7. 開発ポリシーと既存設計に従って実装する
8. テストを実行し、成功を確認する
9. 必要に応じてリファクタリングする
10. フォーマット、lint、typecheck などがあれば実行する
11. リファクタ後もテストが成功することを確認する
12. 必要に応じて README、HUMAN_IN_THE_LOOP.md、CODING_RULES.md を更新する
13. 変更内容、テスト結果、未解決事項を報告する

## Branch Strategy

- 新しいタスクごとに作業ブランチを作成する
- ブランチ名には GitHub Issue 番号を含める
- 例: `feature/YYYYMMDD/codex/issue-<number>/short-description`
- `main` ブランチに直接コミットしてはならない
- 必要に応じて `main` から rebase または merge して最新状態を保つ

## TDD Rules

- 原則として、実装前に失敗するテストを書く
- テストを通すための最小実装を優先する
- テストが通った後にリファクタリングする
- リファクタリング後も同じテストを再実行する
- テストできない変更は、理由と手動確認手順を記録する

## Constraints

- 実装計画にない大規模変更を勝手に行わない
- 既存 API の互換性を壊す場合は明示する
- 既存のコードスタイルに合わせる
- 不要な依存を追加しない
- テスト失敗や未検証項目を隠さない

## Recommended Commands

```bash
git status
git checkout -b feature/YYYYMMDD/codex/issue-<number>/short-description
bundle exec rake
bundle exec rspec
bundle exec rubocop
git diff
```

## Output Format

````md
## Implementation Result

### Branch

### Summary

### Changed Files

### Tests Added or Updated

### Commands Run

```text
<command and result>
```

### Documentation Updates

### Deviations from Plan

### Remaining Issues

### Next Step for Review
````
