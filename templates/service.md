# Service 模板

服务方法应明确事务边界、幂等策略和异常语义。外部调用不要无理由放进数据库事务；状态变更使用条件更新或版本控制。

```java
@Service
@RequiredArgsConstructor
class OrderApplicationService {
    private final OrderRepository repository;

    @Transactional
    public OrderResponse create(CreateOrderRequest request) {
        // 校验、幂等、持久化和事件发布按项目方案实现
        return OrderResponse.from(repository.save(Order.create(request)));
    }
}
```
