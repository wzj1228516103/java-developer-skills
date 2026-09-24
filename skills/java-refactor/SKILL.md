---
name: java-refactor
description: 在保持已有行为和接口兼容的前提下，渐进式重构 Java 后端遗留代码。Use when splitting services, isolating layers, or reducing duplication.
---

# /java-refactor

先建立现有行为基线和回归测试，识别调用方、事务、权限、序列化和数据库影响，再设计小步拆分。优先处理跨层调用、重复逻辑、过大 Service 和 Entity/DTO 泄露，不为了风格一次性重写模块。

每一步输出影响范围、保持不变的行为、风险、验证命令和下一步；读取根目录 `references/architecture.md`、`java-core.md`、`testing.md` 及命中的专项规则。

共享规则入口：`../../SKILL.md`。
