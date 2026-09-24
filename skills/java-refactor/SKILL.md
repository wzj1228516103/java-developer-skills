---
name: java-refactor
description: 在保持已有行为和接口兼容的前提下，渐进式重构 Java 后端遗留代码。Use when splitting services, isolating layers, or reducing duplication.
---

# /java-refactor

先确认重构目标和不可改变的行为；对有真实风险的边界建立基线，再设计小步拆分。只分析与当前模块有关的调用方、事务、权限、序列化或数据库影响，不为了风格一次性重写模块。

给出可回滚的小步计划和必要验证。通常只读取 `architecture.md` 和一个命中的专项规则；只有需要补测试时才读取 `testing.md`。

共享规则入口：`../../SKILL.md`。
