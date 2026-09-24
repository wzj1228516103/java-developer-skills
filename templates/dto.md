# DTO/Response 模板

请求 DTO 只表达输入契约，使用 Jakarta Validation；Response 只输出允许公开的字段。不要复用数据库 Entity 作为双向输入输出模型。

```java
public record CreateOrderRequest(
        @NotBlank String productId,
        @Positive int quantity) {}
```
