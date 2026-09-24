---
name: java-review
description: 审查 Java/Spring 后端代码、提交或 PR，重点检查安全、数据、事务、并发、SQL 性能和测试风险。Use for code review or pre-commit self-check.
---

# /java-review

先确认变更范围和项目约定，再按风险顺序检查：编译/类型、需求行为、数据与事务、安全、并发可靠性、SQL 性能、可测试性。按 `BLOCKER/MUST/SHOULD/MAY` 输出规则编号、位置、证据、风险、建议和例外条件。

只直接修复低风险机械问题；事务边界、权限、缓存一致性、数据库迁移和接口行为先说明影响，不擅自改变业务语义。读取根目录 `references/` 中命中的规则和 `templates/` 的测试建议。

共享规则入口：`../../SKILL.md`。
