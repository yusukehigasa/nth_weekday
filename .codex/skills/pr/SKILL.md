---
name: pr
description: 指定された Issue と実装内容を確認し、PR 作成可否を判断したうえで GitHub Pull Request を作成する。
---

# Pull Request Skill

あなたは PR 作成担当です。

指定された Issue と実装内容に対して、PR を作成できる状態か確認し、問題がなければ GitHub Pull Request を作成してください。作成にふさわしくない状態であれば、PR は作成せず、修正案を提示してください。

## Responsibilities

- 作業ブランチと差分を確認する
- 未コミット変更の有無を確認する
- テスト、lint、CI 相当チェックを確認する
- README、HUMAN_IN_THE_LOOP.md、CODING_RULES.md の更新漏れを確認する
- Issue との対応関係を確認する
- PR タイトルと本文を作成する
- PR を作成し、URL をユーザーへ報告する

## Procedure

1. 対象 Issue、実装結果、レビュー結果を確認する
2. 現在のブランチを確認する
3. `main` など保護対象ブランチ上で作業していないことを確認する
4. `git status` で未コミット変更を確認する
5. 差分を確認し、PR に含める内容が妥当か確認する
6. テスト、lint、フォーマット、CI 相当チェックを実行または確認する
7. ドキュメント更新漏れがないか確認する
8. PR 作成に不適切な状態であれば、理由と修正案を提示して終了する
9. PR タイトルと本文を作成する
10. 関連 Issue がある場合は `Closes #<number>` を含める
11. Label や Milestone は設定しない
12. PR を作成する
13. PR 内容と URL をユーザーへ報告する

## PR Readiness Checklist

- 作業ブランチ上である
- 未コミット変更がない
- 不要な差分が含まれていない
- テストが成功している
- lint / format / typecheck が必要に応じて成功している
- README / HUMAN_IN_THE_LOOP.md / CODING_RULES.md の更新要否を確認済み
- Issue との対応が明確
- レビュー指摘の Blocker が解消済み

## Constraints

- PR 作成にふさわしくない状態では PR を作成しない
- Label や Milestone は設定しない
- CI やテストの失敗を隠さない
- 関連 Issue がある場合は PR 本文に必ず含める
- 追加コメントが必要な場合は GitHub Issue にコメントする

## Recommended Commands

```bash
git status
git branch --show-current
git diff --stat
git log --oneline --decorate -n 10
bundle exec rake
bundle exec rspec
bundle exec rubocop
gh pr create
gh pr view --web
```

## PR Body Template

````md
## Summary

## Related Issue

Closes #<number>

## Changes

-
-
-

## Test Results

```text
<command and result>
```

## Documentation

## Notes

## Checklist

- [ ] Tests pass
- [ ] Documentation updated or not required
- [ ] No unrelated changes
- [ ] Review blockers resolved
````

## Output Format

```md
## PR Result

- Status: created | not created
- PR:
- URL:
- Branch:
- Related Issue:

## Summary

## Checks

## Notes
```
