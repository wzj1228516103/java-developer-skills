# 异常、校验与日志

## MUST

- 区分参数校验异常、可预期业务异常和系统异常；统一异常处理器负责协议转换。
- 捕获异常时保留原始 cause；禁止空 `catch`、`printStackTrace`、只打印消息后丢弃堆栈。
- 日志不得包含密码、Token、完整身份证号、支付密钥等敏感数据；按项目约定脱敏。
- 错误码稳定、可检索；客户端消息与内部诊断信息分离。

## SHOULD

- 在边界层记录一次足够的错误上下文，避免同一异常多层重复打印堆栈。
- 日志包含 trace/request 标识、业务对象标识和可操作上下文，但避免大对象和循环内刷屏。

公共响应、异常和日志格式分别见 `contracts/response.md`、`contracts/exception.md`、`contracts/logging.md`。
