# Ansible Deploy

## ansible add key

```
make add-key
```

## 更换源、dns、apt upgrade等

```
make apt
```

## 安装docker

```
make docker-install
```

## 查看是否安装成功

```
make docker-status
```

## 登录docker镜像仓库

```
make login
```


## 首次部署

> 拷贝安装目录、配置等

```
make install
```

# 启动所有docker容器

```
make up
```

# 停止销毁所有docker容器

```
make down
```

## 持续部署更新

### 部署Xswitch

```
make deploy-xswitch
```

### 部署cman

```
make deploy-cman
```

### 部署uas

```
make deploy-uas
```

### 同时部署上述三个服务

```
make deploy
```

## 清理压缩包

```
make clean
```