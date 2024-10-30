```
说明：这是一个容器镜像构建和运行脚本
1. common.sh: 用于配置镜像参数，如：基础镜像，目标镜像domain/namespace/name:tag参数。
2. Dockerfile: 里面有构建triton-x及其依赖的llvm, python, python, torch等环境
3. build.sh: 编译生成容器镜像的脚本
  bash build.sh
4. start.sh: 容器运行脚本，-u是镜像名前缀名，-p是映射端口用于ssh连接容器，-s是停止并删除容器(PS:要与-u一起使用)
  bash start.sh -u xxx -p 9000
  如果要删除容器：bash start.sh -u xxx -s
```
