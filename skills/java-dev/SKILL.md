---
name: java-dev
description: 使用当前项目技术栈开发或生成 Java/Spring 后端代码，包括 Controller、DTO、Service、Mapper、SQL 和业务逻辑。Use when the user asks to implement a new backend feature or code skeleton.
---

# /java-dev

任务明确指向当前项目时，先读取构建文件、现有同类代码和项目规范；如果用户给的是自包含需求，不要扫描工作区。每次只读取根目录 `references/` 中最相关的 1～3 个主题。生成前按需使用根目录 `templates/`，不要凭空创建项目已有的公共响应类、异常类或工具类。

输出应包含：实现或代码骨架、关键假设、事务/幂等/权限边界、测试建议。涉及数据库、权限、支付、库存、消息一致性时，先说明风险和方案再修改。

共享规则入口：`../../SKILL.md`。
