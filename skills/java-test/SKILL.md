---
name: java-test
description: 为 Java/Spring 后端补充单元、集成、API、并发和消息可靠性测试。Use when the user asks to generate or improve backend tests.
---

# /java-test

先读取被测代码和项目测试框架，优先复用现有测试工具。至少覆盖成功、边界、异常、权限、幂等、并发冲突和外部依赖失败路径；区分单元测试与真实协议/事务/数据库的集成测试。

生成测试后说明隔离策略、测试数据清理、需要运行的命令和未覆盖风险。读取根目录 `references/testing.md` 及被测模块相关规则，模板参考 `templates/tests.md`。

共享规则入口：`../../SKILL.md`。
