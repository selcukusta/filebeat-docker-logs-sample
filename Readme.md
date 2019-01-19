# Collect Container Logs with FileBeat, Store on Elasticsearch and Visualize with Kibana

Run it;

```bash
vagrant up
```

Elasticsearch instance is running on `172.81.81.3:9200`

Kibana instance is running on `172.81.81.3:5601`

## Create Dummy Logs

You can use sample application to create dummy logs. Connect to **app01** machine via `vagrant ssh app01` and run it; `sudo docker container run --name beat -p 5000:5000 -d selcukusta/filebeat:3.0.0`. 


When you visit `172.81.81.2:5000/api/home` url, dummy log is displayed on console output, *Filebeat* will catch it and write to *Elasticsearch* instance.