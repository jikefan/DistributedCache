# Makefile

# 设置输出文件名和路径
OUTPUT := out/server

# 设置Go源文件的路径（假设main.go是你的入口文件）
GO_SRC := main.go

# 设置RocksDB的目录
ROCKSDB_DIR := rocksdb

# 默认目标：构建分布式缓存服务器
all: $(OUTPUT)

# 构建RocksDB静态库
$(ROCKSDB_DIR)/librocksdb.a:
	@echo "Building RocksDB static library..."
	@cd $(ROCKSDB_DIR) && make static_lib
	@echo "RocksDB static library built."

# 构建Go项目
$(OUTPUT): $(GO_SRC) $(ROCKSDB_DIR)/librocksdb.a
	@echo "Building DistributedCache server..."
	@echo "Go server built successfully."

# 清理生成的文件
clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)
	@cd $(ROCKSDB_DIR) && make clean
	@echo "Cleaned up."

.PHONY: all clean