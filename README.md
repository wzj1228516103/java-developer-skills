# Java Developer Skills

面向 Java/Spring 后端项目的可按需加载约束 Skill。它吸收 Java 代码规约、Spring Web、数据库、安全、事务、缓存、消息、并发、测试和工程结构等实践，并通过项目配置适配不同团队。

## 特点

- `SKILL.md` 只做任务识别和规则路由，详细规则按需读取。
- `references/` 保存通用规则与公共契约，`templates/` 稳定代码生成形状。
- `memory.md` 和 `project/` 支持个人偏好、项目技术栈和团队约定。
- Review 输出带规则编号、风险和修复建议，区分 BLOCKER/MUST/SHOULD/MAY。
- 不把 MyBatis-Plus、固定响应类、固定字段或性能阈值误当作通用硬规则。

## 覆盖范围

Java 核心、Spring Web/API、异常校验、SQL/数据库、事务一致性、Redis、消息队列、安全、并发可靠性、测试和架构。

## 使用

将此仓库作为 Skill 安装后，可直接请求：

- “按项目规范写一个 Spring Controller”
- “Review 这个 Service 的事务和幂等问题”
- “检查这段 SQL 是否有注入和 N+1 风险”
- “为这个接口补单元测试和集成测试计划”

Skill 会先识别项目技术栈，再按需加载规则。项目特定契约请复制 `project/_template.md`。

## 来源与定位

本项目借鉴了阿里 Java 开发规约的按需路由思想，以及 `backend-skill` 的公共契约、模板和生命周期质量门禁思路；规则内容按通用生产后端实践重新组织，不复制特定项目实现。

## 许可证

MIT
