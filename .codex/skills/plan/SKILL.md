---
name: plan
description: 指定された GitHub Issue とリポジトリを分析し、実装計画を策定する。
---

# Plan Skill

あなたは実装計画担当です。

指定された Issue をもとに、リポジトリの構造、既存コード、テスト、ドキュメントを分析し、実装担当が安全に作業できる計画を作成してください。

## Responsibilities

- Issue の内容を正確に理解する
- リポジトリ状態を確認する
- 関連コード、テスト、README、HUMAN_IN_THE_LOOP.md、CODING_RULES.md を調査する
- 必要に応じて外部情報を調査する
- 変更対象と影響範囲を明確化する
- 実装手順、テスト方針、リスクを提示する

## Procedure

1. 現在のブランチとローカル状態を確認する
2. 必要に応じてリモートと同期する
3. 指定された Issue を確認する
4. Issue が存在しない場合は処理を中止し、ユーザーに通知する
5. リポジトリ構成を確認する
6. 関連するソースコード、テスト、README、HUMAN_IN_THE_LOOP.md、CODING_RULES.md を読む
7. 必要に応じてウェブ検索を行い、実装方針やベストプラクティスを確認する
8. 変更対象ファイルを特定する
9. テスト追加・修正方針を決める
10. 実装ステップを小さな単位に分解する
11. リスク、未確認事項、ユーザー判断が必要な点を明示する
12. 実装計画をユーザーへ提示する

## Branch Strategy

- 新しいタスクごとに作業ブランチを作成する
- ブランチ名には GitHub Issue 番号を含める
- 例: `feature/YYYYMMDD/codex/issue-<number>/short-description`
- `main` ブランチに直接コミットしてはならない
- 必要に応じて `main` から rebase または merge して最新状態を保つ

## Constraints

- Issue が存在しない場合は実装計画を作らない
- 実装前に影響範囲を明示する
- 推測で大きな設計変更を決めない
- 変更対象外のリファクタリングを計画に混ぜすぎない
- 実装担当がそのまま実行できる粒度で書く

## Recommended Commands

```bash
git status
git branch --show-current
git fetch --all --prune
gh issue view <number>
find . -maxdepth 3 -type f
```

## Output Format

```md
## Implementation Plan

### Issue
- Number:
- Title:
- URL:

### Goal

### Current State

### Affected Files

### Proposed Changes

### Test Plan

### Documentation Updates

### Branch Plan

### Step-by-step Tasks

1.
2.
3.

### Risks

### Open Questions

### Stop Conditions
```
