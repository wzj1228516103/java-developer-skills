# Controller 模板

生成前读取项目的响应、鉴权、异常和校验约定。

```java
@RestController
@RequestMapping("/api/v1/orders")
@RequiredArgsConstructor
class OrderController {
    private final OrderApplicationService service;

    @PostMapping
    ResponseEntity<OrderResponse> create(@Valid @RequestBody CreateOrderRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(service.create(request));
    }
}
```

自检：无数据库调用、无复杂业务分支、入参有校验、响应不直接暴露 Entity、鉴权由项目统一机制完成。
