---
name: java-developer-skills
description: 面向 Java 后端项目的代码生成、Review、接口与数据库设计约束。覆盖 Java 核心、Spring Web、异常校验、SQL、事务一致性、安全、并发可靠性、测试和工程结构；当用户编写、修改、审查或设计 Java/Spring 后端代码时使用。默认适配 Java 17+ 与 Spring Boot，但会先识别项目技术栈，不将项目特定约定误当作通用规则。
---

# Java 后端约束

本 Skill 把“工程约束”和“项目流程”分开：约束用于指导代码决策，模板用于稳定生成结果，项目配置用于覆盖默认值。不要为了满足风格规则而改变用户未授权的业务行为。

## 工作方式

1. 识别任务：代码生成、Review、接口设计、SQL/表设计、故障排查、测试或架构设计。
2. 识别上下文：只有任务明确指向当前项目、文件或变更时，才读取相关的 `pom.xml`/`build.gradle`、配置文件和现有同类代码；自包含代码片段、规则问答和纯设计题不要扫描工作区。
3. 读取个性化配置：先读 `memory.md`，再读 `project/<项目名>.md`；项目约定覆盖默认建议，安全红线除外。
4. 按需读取 `references/` 中最相关的 1～3 个主题，不要一次载入所有规则，也不要为回答一个局部问题递归读取 README、评测文件、所有模板或无关入口。
5. 生成或修改后做与风险匹配的验证：至少检查编译、边界条件、异常路径和测试；数据库、权限、事务、并发变更要增加专项检查。

## 路由表

| 任务/关键词 | 首选参考 |
|---|---|
| Java 基础、命名、日期、金额、集合、空值 | `references/java-core.md` |
| Controller、DTO、REST、参数校验 | `references/spring-web.md`、`references/exception-validation.md` |
| 异常、错误码、日志 | `references/exception-validation.md`、`references/contracts/exception.md`、`references/contracts/logging.md` |
| SQL、表、索引、分页、ORM | `references/database-sql.md` |
| 事务、幂等、状态流转、一致性 | `references/transaction-consistency.md` |
| Redis、缓存、分布式锁 | `references/redis-cache.md` |
| MQ、重复消费、重试、死信 | `references/message-queue.md` |
| 认证、授权、注入、脱敏、上传 | `references/security.md` |
| 线程池、超时、重试、限流、降级 | `references/concurrency-reliability.md` |
| 单测、集成测试、Testcontainers | `references/testing.md` |
| 分层、模块、依赖方向 | `references/architecture.md` |
| 响应、错误码、分页、公共字段 | `references/contracts/` 下对应文件 |

## 命令式入口

用户可以在请求开头使用以下入口别名。入口只是任务模式，不改变规则优先级；命中后仍需识别项目技术栈并按需读取参考文件。

| 入口 | 模式 | 默认读取 |
|---|---|---|
| `/java-dev` | 新功能开发、代码生成 | Java 核心 + Spring Web + 相关契约 |
| `/java-design` | 接口、数据库、事务和架构设计 | 架构 + 数据库 + 事务一致性 |
| `/java-review` | 代码审查、提交前自检 | 安全 + 数据库 + 事务 + 并发可靠性 + 测试 |
| `/java-test` | 单元、集成和可靠性测试 | 测试 + 被测模块相关规则 |
| `/java-fix` | Bug 定位和最小修复 | 异常日志 + 可疑模块规则 + 测试 |
| `/java-refactor` | 保持行为不变的渐进式重构 | 架构 + Java 核心 + 测试 |
| `/java-rules` | 查询、解释或比较规则 | 用户点名的参考文件 |

## 规则等级

- **BLOCKER**：安全漏洞、数据损坏、严重一致性或线上故障风险；必须处理或明确记录例外。
- **MUST**：生产代码默认必须遵守。
- **SHOULD**：默认遵守；有项目或性能理由时可以例外并说明。
- **MAY**：可选建议或团队偏好。

裁决优先级：用户明确需求和已有行为 > 安全与数据正确性 > 可靠性与一致性 > 性能 > 可维护性 > 纯风格。重构存量代码时优先保持行为不变；不要把阈值（如方法行数、批量大小）机械判定为缺陷，应结合数据量、调用频率和运行环境。

## 生成与 Review 约定

生成代码时优先使用 `templates/` 中的对应模板，并遵守项目现有公共类和命名。Review 时按以下顺序检查：编译/类型 → 需求行为 → 数据与事务 → 安全 → 并发可靠性 → SQL 性能 → 可测试性。

Review 输出采用：

```text
[等级] 规则编号
位置：文件:行号（可确定时）
问题：
风险：
建议：
例外条件：
```

只对机械且低风险的问题直接修复；事务边界、接口行为、缓存一致性、数据库迁移和权限逻辑应先说明影响，再按用户授权修改。

## 适用边界

- 生产代码和 PR Review：完整启用。
- Demo、脚本、一次性迁移：保留 BLOCKER/MUST，SHOULD 可按成本豁免。
- 遗留代码：分阶段改造，不要求一次性清零全部问题。
- 用户明确要求不应用本 Skill：停止应用本 Skill 的约束。

详细规则请按路由表按需读取；项目特定约定放入 `project/`，不要修改本文件来容纳单个项目的偏好。
