---
name: java-design
description: 设计 Java 后端接口、数据库、事务、缓存、消息和模块架构。Use before implementing a medium or high-risk backend feature.
---

# /java-design

先确认需求边界、已有接口和技术栈，再读取根目录 `references/architecture.md`、`database-sql.md`、`transaction-consistency.md` 以及命中的 Redis、消息、安全规则。输出技术方案、数据模型、接口契约、状态流转、失败路径、幂等策略和验证计划，不在方案阶段擅自修改代码。

复杂流程使用时序、状态或流程描述；数据库变更必须说明兼容、迁移和回滚策略。

共享规则入口：`../../SKILL.md`。
