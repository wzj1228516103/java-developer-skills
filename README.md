# Java Developer Skills

> 面向 Java/Spring 后端项目的可按需加载 Skill：让代码生成、接口设计、数据库变更、代码 Review 和测试补全遵循一致的生产级约束。

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Java](https://img.shields.io/badge/Java-17%2B-orange.svg)](https://www.oracle.com/java/technologies/javase/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen.svg)](https://spring.io/projects/spring-boot)

## 为什么需要这个 Skill

Java 后端代码的问题通常不在“能不能编译”，而在于隐含的工程约束没有被持续执行：

| 问题 | 常见表现 | 可能后果 |
|---|---|---|
| 接口边界混乱 | Controller 直接访问 Mapper，Entity 直接返回前端 | 难以演进，容易泄露内部字段 |
| 数据与事务风险 | 事务包住远程调用、重复提交没有幂等、先查后改 | 数据不一致、重复扣款或状态错乱 |
| 安全缺口 | 信任前端 userId、SQL 拼接、日志记录 Token | 越权、注入、敏感数据泄露 |
| 可靠性不足 | 无超时、无限重试、消息重复消费未处理 | 线程耗尽、消息堆积、级联故障 |
| 规范难以落地 | 规则散落在文档中，生成代码时经常遗漏 | Review 成本高，团队风格漂移 |

Java Developer Skills 将规则、公共契约和代码模板组合起来，并根据项目实际技术栈按需加载，不把某个团队的实现细节伪装成通用标准。

## 核心能力

- **按需路由**：`SKILL.md` 负责识别任务和选择规则，详细内容保存在 `references/`。
- **生产后端约束**：覆盖 Java 核心、Spring Web、异常校验、SQL、事务、Redis、消息队列、安全、并发、测试和架构。
- **公共契约复用**：统一响应、错误码、异常、分页和日志规则，避免模板之间互相矛盾。
- **稳定代码生成**：通过 `templates/` 提供 Controller、DTO、Service、SQL 和测试的生成形状。
- **上下文适配**：先识别 Java/Spring/ORM/数据库/中间件，再应用规则；支持 `memory.md` 和项目级配置覆盖默认建议。
- **可解释 Review**：使用 `BLOCKER / MUST / SHOULD / MAY` 分级，输出规则编号、证据、风险和修复建议。
- **风险匹配的流程**：大型功能可走需求—设计—开发—Review—测试闭环，小范围修改不强制套用完整流程。

## 覆盖范围

| 模块 | 关注点 | 参考文件 |
|---|---|---|
| Java 核心 | 空值、时间、金额、集合、并发安全、资源释放 | `references/java-core.md` |
| Spring Web/API | Controller、DTO、REST、参数校验、接口兼容 | `references/spring-web.md` |
| 异常与日志 | 错误码、全局异常、日志级别、敏感信息 | `references/exception-validation.md` |
| 数据库与 SQL | 参数绑定、索引、分页、N+1、迁移 | `references/database-sql.md` |
| 事务与一致性 | 事务边界、幂等、状态机、补偿 | `references/transaction-consistency.md` |
| Redis | TTL、缓存一致性、穿透/击穿/雪崩、分布式锁 | `references/redis-cache.md` |
| 消息队列 | 重复消费、重试、死信、顺序、消息协议 | `references/message-queue.md` |
| 安全 | 认证授权、越权、注入、SSRF、脱敏、上传 | `references/security.md` |
| 并发与可靠性 | 线程池、超时、重试、限流、熔断、降级 | `references/concurrency-reliability.md` |
| 测试 | 单元、集成、容器化依赖、幂等和并发测试 | `references/testing.md` |
| 架构 | 分层、模块边界、依赖方向、领域对象隔离 | `references/architecture.md` |

## 快速开始

### 安装到 Codex

使用 Git 安装到 Codex 全局 Skill 目录：

```bash
git clone https://github.com/wzj1228516103/java-developer-skills.git \
  ~/.codex/skills/java-developer-skills
```

Windows PowerShell：

```powershell
git clone https://github.com/wzj1228516103/java-developer-skills.git `
  "$env:USERPROFILE\.codex\skills\java-developer-skills"
```

也可以将仓库目录作为项目级 Skill 放入项目的 `.codex/skills/` 或 `.claude/skills/`，具体取决于 Agent 工具的 Skill 加载方式。

### 第一次使用

在 Java 项目中直接提出任务即可，例如：

```text
按当前项目的技术栈写一个创建订单的 Spring Controller 和 Service。
```

Skill 会先读取构建文件和现有代码，识别项目约定，再按需加载 Controller、校验、事务和响应契约。也可以显式要求专项检查：

```text
Review 这个 Service 的事务边界、幂等性和并发风险。
检查这段 MyBatis SQL 是否有注入、N+1 和索引问题。
为这个消息消费者补充重复消费、重试和死信测试。
```

## 推荐工作流

### 新功能开发

```text
需求澄清 → 技术方案 → 任务拆分 → 代码生成/实现
    → 编译与 Review → 补充测试 → 运行测试 → 文档同步
```

简单改动可以直接从“实现”开始；涉及权限、支付、库存、数据库迁移、事务或消息一致性时，应先形成方案和风险清单。

### 代码 Review

Review 按风险顺序检查：

```text
编译/类型 → 需求行为 → 数据与事务 → 安全
    → 并发可靠性 → SQL 性能 → 可测试性
```

输出示例：

```text
[BLOCKER] SECURITY-OWNERSHIP-001
位置：UserController.java:42
问题：接口直接信任请求中的 userId，没有校验当前登录用户的资源归属。
风险：攻击者可以修改其他用户资料。
建议：从认证上下文获取操作者身份，并在服务层校验资源归属。
例外条件：内部批处理接口必须使用独立的服务身份和审计记录。
```

### 需求变更和遗留代码

先分析影响范围，再修改代码；涉及数据库、公共接口或消息协议时记录兼容性和回滚策略。遗留代码以保持行为不变为第一目标，按风险分阶段改造，不要求一次性清零所有规范问题。

## 规则等级与裁决顺序

| 等级 | 含义 |
|---|---|
| `BLOCKER` | 安全漏洞、数据损坏、严重一致性或线上故障风险 |
| `MUST` | 生产代码默认必须遵守 |
| `SHOULD` | 默认遵守，有明确理由可以例外 |
| `MAY` | 可选建议或团队偏好 |

规则冲突时遵循：

```text
用户明确需求和已有行为
  > 安全与数据正确性
  > 可靠性与一致性
  > 性能
  > 可维护性
  > 纯代码风格
```

不要机械地把“方法行数”“批量大小”“分页偏移量”等阈值判定为缺陷，应结合数据量、调用频率、运行环境和已有基准判断。

## 项目适配

### 个人偏好

`memory.md` 记录跨项目的个人选择，例如：

- Java 版本
- 金额使用 `BigDecimal` 还是最小货币单位
- Lombok 使用范围
- ORM 和测试框架
- API 响应风格

### 项目规范

复制 `project/_template.md` 为 `project/<项目名>.md`，填写项目技术栈和公共契约：

```yaml
java_version: 17
spring_boot: 3.x
orm: mybatis-plus
database: mysql
cache: redis
message_queue: rocketmq
```

项目规范可以覆盖默认命名和实现选择，但不能放宽安全、权限、参数化查询和数据正确性红线。

## 仓库结构

```text
java-developer-skills/
├── SKILL.md                    # 总纲、路由、等级和适用边界
├── agents/openai.yaml          # Agent 界面元数据
├── memory.md                   # 个人偏好
├── project/
│   ├── README.md               # 项目配置说明
│   └── _template.md            # 项目规范模板
├── references/                 # 按主题加载的详细规则
│   └── contracts/              # 响应、异常、错误码、分页、日志契约
├── templates/                  # Controller、DTO、Service、SQL、测试模板
└── evals/                      # 评测入口和场景
```

## 评测与质量保证

`evals/eval.yaml` 包含第一批场景：

- Controller 参数校验和响应边界
- SQL 注入与动态标识符白名单
- 事务中调用远程服务
- 用户资源归属和租户边界
- 缓存一致性与消息重复消费
- 遗留代码的渐进式重构

评测重点不是是否出现某个关键词，而是是否识别真实风险、给出可执行修复、尊重项目上下文并避免无授权的过度修改。

## 适用边界

- 生产代码和 PR Review：完整启用。
- Demo、一次性脚本和临时迁移：保留 `BLOCKER/MUST`，`SHOULD` 可按成本豁免。
- 与项目既有规范冲突时：优先项目契约；涉及安全和数据正确性的规则除外。
- 用户明确要求关闭本 Skill：不再应用本 Skill 的约束。

本项目提供工程指导，不替代组织的安全审计、数据库变更审批、架构评审和发布流程。

## 参考来源与定位

本项目借鉴了：

- [Alibaba Java Development Guide](https://github.com/Sxuan-Coder/alibaba-java-development-guide)：按需路由、规则分级、个人和项目配置、评测用例。
- [backend-skill](https://github.com/zhangloveyan/backend-skill)：公共契约、代码模板、开发生命周期、Review 和测试闭环。

规则内容按通用生产后端实践重新组织，不复制上述项目的特定项目实现或业务约定。

## 贡献指南

欢迎提交规则、模板和评测用例。新增内容建议遵循：

1. 说明规则适用场景和风险，不只写结论。
2. 区分 `BLOCKER/MUST/SHOULD/MAY`，避免把团队偏好写成通用硬规则。
3. 同时补充正例、反例或可验证的评测场景。
4. 不引入与具体项目绑定的类名、包名、错误码和数据库字段作为全局规则。
5. 修改后运行 `skill-creator` 的 `quick_validate.py`，并检查相关 YAML 和链接。

## 许可证

[MIT License](LICENSE)
