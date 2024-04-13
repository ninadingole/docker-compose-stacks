package main

import (
	"context"
	"fmt"
	"github.com/weaviate/weaviate-go-client/v4/weaviate"
)

func main() {
	cfg := weaviate.Config{
		Host:   "localhost:8080", // Replace with your endpoint
		Scheme: "http",
	}

	client, err := weaviate.NewClient(cfg)
	if err != nil {
		panic(err)
	}

	schema, err := client.Schema().Getter().Do(context.Background())
	if err != nil {
		panic(err)
	}
	fmt.Printf("%v", schema)
}
