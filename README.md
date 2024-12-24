# DistributedCache

> 学习练手项目

> 这个项目是分布式缓存系统，使用Go语言实现，目前支持内存和rocksdb两种缓存方式。

## 编译项目

```sh
# 在项目根目录下执行
make
```

## 运行项目

```sh
# 默认启动基于内存的缓存服务
make run

# 启动基于rocksdb的缓存服务
make run-rocksdb
```

## 项目结构

```
.
├── cache
├── go.mod
├── http
├── main.go
├── Makefile
├── out
├── README.md
├── rocksdb
└── tcp