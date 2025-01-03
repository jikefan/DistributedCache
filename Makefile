# Makefile

# 设置输出文件名和路径
OUTPUT := out/server

# 设置Go源文件的路径
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
	@CGO_CFLAGS="-I$(ROCKSDB_DIR)/include" CGO_LDFLAGS="-L$(ROCKSDB_DIR)" go build -o $@ $(GO_SRC)
	@echo "Go server built successfully."

# 运行分布式缓存服务器
run: $(OUTPUT)
	@./$(OUTPUT)

# 运行基于RocksDB的可持久化的分布式缓存服务器
run-rocksdb: $(OUTPUT)
	@./$(OUTPUT) -type rocksdb

# 清理生成的文件
clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)
	@cd $(ROCKSDB_DIR) && make clean
	@echo "Cleaned up."

.PHONY: all clean