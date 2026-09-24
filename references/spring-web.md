# Spring Web 与 API

## MUST

- Controller 只负责协议适配、鉴权入口和调用应用服务；复杂业务、事务和持久化放在服务层。
- 请求使用专用 DTO/Command，响应使用 VO/Response；除非明确是内部接口，不直接暴露 Entity/DO。
- 对外输入使用 Bean Validation 或项目统一校验器；校验失败通过统一异常处理返回稳定错误结构。
- 路径、HTTP 方法、状态码和分页语义与现有 API 保持一致；新增字段应考虑向后兼容。

## SHOULD

- 写操作考虑幂等键或业务唯一约束；导出、大文件和长任务不要同步占用请求线程。
- API 文档和示例与实现同步；不要把内部异常消息、堆栈、SQL 暴露给客户端。

生成代码时先读取 `references/contracts/response.md`、`request-validation.md` 和项目配置，使用项目实际的响应类而不是凭空创建新公共类。
