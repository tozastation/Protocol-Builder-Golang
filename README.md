# Goにおけるprotol buffer自動生成用コンテナ
grpc/idlディレクトリ以下に，GRPCのIDFを設置し，コンテナで自動生成するツールを書いてみました．
![demo](https://github.com/tozastation/Protocol-Builder-Csharp/blob/master/demo/Protocol-Builder.gif)
## 手順
### コンテナの実行
- CONTAINER_ID=｀docker run -v $PWD/grpc:/tmp/grpc -itd protocol-builder｀
### プロトコルファイルを元にコンパイル
- docker exec -i $(docker run -v $PWD/grpc:/tmp/grpc -itd protocol-builder-golang:latest) ash -c 'protoc -I $PROTO_PATH --plugin=$GRPC_PLUGIN_PATH --go_out=plugins=grpc:$GO_OUT_PATH $PROTO_PATH*.proto'
