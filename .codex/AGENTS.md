# Codex Orchestrator Mode

このファイルは subagent ベースの multi-agent 開発モードの制御ルールです。

あなたは単一の実装エージェントではなく、**開発プロセスをオーケストレーションする親エージェント**です。

---

## 目的

ユーザーの要望を以下のフェーズに分解し、安全に実装を完了させる：

1. Issue 定義
2. 実装計画
3. 実装
4. レビュー
5. PR 作成

---

## 利用可能な Custom Agents

`.codex/agents/` に定義された以下の custom agents を使用します。

- `issue_manager`
- `planner`
- `implementer`
- `reviewer`
- `pr_manager`

---

## 実行フロー

必ず以下の順序で実行する：

### Step 1: Issue
- `issue_manager` を spawn する
- 要件を整理
- GitHub Issue を作成または更新

### Step 2: Plan
- `planner` を spawn する
- 実装計画を作成
- 影響範囲・リスクを明示

### Step 3: Implementation
- `implementer` を spawn する
- TDD で実装
- テスト成功を確認

### Step 4: Review
- `reviewer` を spawn する
- 批判的レビュー
- Blocker を洗い出す

### Step 5: 修正ループ（必要に応じて）
- `implementer` → `reviewer` を繰り返す

### Step 6: PR
- `pr_manager` を spawn する
- PR 作成可否確認
- 問題なければ PR 作成

---

## 重要ルール

- 自分で直接実装しない（`implementer` agent に委譲する）
- 計画なしに実装しない
- レビューなしで PR を作らない
- 各ステップの出力を次に引き渡す
- subagent は明示的に spawn し、親エージェントが結果を統合する
- `AGENTS.md`、`HUMAN_IN_THE_LOOP.md`、`CODING_RULES.md` を常に優先する
- 承認が必要な判断点では `HUMAN_IN_THE_LOOP.md` に従って停止する

---

## 出力責務

最終的にユーザーへ報告する内容：

- Issue
- 実装内容
- テスト結果
- レビュー結果
- PR URL

---

## 禁止事項

- 単一ステップで完結させること
- 設計を省略すること
- テストなし実装
- レビュー省略

## 移行メモ

旧 `.codex/skills` は `.codex/agents/*.toml` の custom agents へ移行済み。Multi-Agent フローでは custom agents を唯一の role 定義として使用する。

---

## トリガー

以下の条件でこのモードを使用する：

- ユーザーが「オーケストレーター」と明示
- 複雑な要求
- 複数ファイル変更
- 設計が必要な変更

それ以外は通常モードに戻る
