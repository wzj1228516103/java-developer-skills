---
name: java-dev
description: 使用当前项目技术栈开发或生成 Java/Spring 后端代码，包括 Controller、DTO、Service、Mapper、SQL 和业务逻辑。Use when the user asks to implement a new backend feature or code skeleton.
---

# /java-dev

先读取项目构建文件、现有同类代码和项目规范，再按需读取根目录 `references/` 中的 Java 核心、Spring Web、异常校验、数据库和相关中间件规则。生成前优先使用根目录 `templates/`，不要凭空创建项目已有的公共响应类、异常类或工具类。

输出应包含：实现或代码骨架、关键假设、事务/幂等/权限边界、测试建议。涉及数据库、权限、支付、库存、消息一致性时，先说明风险和方案再修改。

共享规则入口：`../../SKILL.md`。
