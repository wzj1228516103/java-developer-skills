---
name: java-test
description: 为 Java/Spring 后端补充单元、集成、API、并发和消息可靠性测试。Use when the user asks to generate or improve backend tests.
---

# /java-test

用户指向现有项目时才读取被测代码和测试框架；自包含示例直接基于给定材料设计测试。优先复用现有测试工具。根据被测行为选择成功、边界、异常、权限、幂等、并发或外部依赖失败路径，不要求每个简单方法覆盖全部类别；区分单元测试与真实协议/事务/数据库的集成测试。

生成测试后说明必要的运行命令和未覆盖风险。复杂集成测试再说明隔离与数据清理；只在需要时读取 `references/testing.md`、一个专项规则或 `templates/tests.md`。

共享规则入口：`../../SKILL.md`。
