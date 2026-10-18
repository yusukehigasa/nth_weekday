# オーケストレーターモード

ルート `AGENTS.md` のモード選択により、親エージェントがこの入口を読む。
工程の唯一の定義は [workflows/orchestrator.md](workflows/orchestrator.md)。開始時に明示的に読む（このディレクトリへの自動探索を前提にしない）。

- 親が工程を管理し、実装を子エージェントに委譲して結果を統合する。
- 子エージェントは委譲された担当だけを実行し、子を spawn しない。追加調査や委譲が必要なら親へ報告する。
- role は `agents/*.toml`。custom agent の利用可否を確認し、使えなければ workflow の fallback を使う。
- ルート `AGENTS.md`、`HUMAN_IN_THE_LOOP.md`、`CODING_RULES.md` を優先する。
