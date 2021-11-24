# TiKV Go-client-example

This is a demo project which demonstrates the use of TiKV database.

[Understand the storage layer of a TiKV cluster](https://tikv.org/docs/5.1/reference/architecture/storage/)

[TiKV Github](https://github.com/tikv/tikv)

[TiKV Go-Client](https://tikv.org/docs/4.0/reference/clients/go/)

## Install Locally

[TiKV in 5 Minutes](https://tikv.org/docs/5.1/concepts/tikv-in-5-minutes/)

## Docker Commands

[Use Docker to deploy a TiKV cluster on multiple nodes](https://tikv.org/docs/3.0/tasks/deploy/docker/)

### Step 1: Pull the latest images of TiKV and PD from Docker Hub

Start Docker and pull the latest images of TiKV and PD from Docker Hub using the following command:

```docker pull pingcap/tikv:latestdocker pull pingcap/pd:latest```

### Step 2: Start PD1 on Node1:

```
sudo docker run -d --name pd1 \
-p 2379:2379 \
-p 2380:2380 \
-v /etc/localtime:/etc/localtime:ro \
-v /data:/data \
pingcap/pd:latest \
--name="pd1" \
--data-dir="/data/pd1" \
--client-urls="http://0.0.0.0:2379" \
--advertise-client-urls="http://192.168.10.226:2379" \
--peer-urls="http://0.0.0.0:2380" \
--advertise-peer-urls="http://192.168.10.226:2380" \
--initial-cluster="pd1=http://192.168.10.226:2380"
```

### Step 3: Start TiKV1 on Node2:

```
sudo docker run -d --name tikv1 \
-p 20160:20160 \
-v /etc/localtime:/etc/localtime:ro \
-v /data:/data \pingcap/tikv:latest \
--addr="0.0.0.0:20160" \
--advertise-addr="192.168.10.226:20160" \
--data-dir="/data/tikv1" \
--pd="192.168.10.226:2379"
```

### Step 4: You can check whether the TiKV cluster has been successfully deployed using the following command:

```
curl 192.168.10.128:2379/pd/api/v1/stores
```

*** Replace 192.168.10.226 with your IPv4 address.