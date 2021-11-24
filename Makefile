create-pd1:
	sudo docker run -d --name pd1 \-p 2379:2379 \-p 2380:2380 \-v /etc/localtime:/etc/localtime:ro \-v /data:/data \pingcap/pd:latest \--name="pd1" \--data-dir="/data/pd1" \--client-urls="http://0.0.0.0:2379" \--advertise-client-urls="http://192.168.10.226:2379" \--peer-urls="http://0.0.0.0:2380" \--advertise-peer-urls="http://192.168.10.226:2380" \--initial-cluster="pd1=http://192.168.10.226:2380"

create-tikv1:
	sudo docker run -d --name tikv1 \-p 20160:20160 \-v /etc/localtime:/etc/localtime:ro \-v /data:/data \pingcap/tikv:latest \--addr="0.0.0.0:20160" \--advertise-addr="192.168.10.226:20160" \--data-dir="/data/tikv1" \--pd="192.168.10.226:2379"