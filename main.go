package main

import (
	"flag"
	"log"

	"github.com/jikefan/DistributedCache/cache"
	"github.com/jikefan/DistributedCache/http"
	"github.com/jikefan/DistributedCache/tcp"
)

func main() {
	typ := flag.String("type", "inmemory", "cache type")
	flag.Parse()
	log.Println("type is", *typ)

	ca := cache.New(*typ)
	go tcp.New(ca).Listen()
	http.New(ca).Listen() // 启动http服务
}
