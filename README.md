# hw_docker_hadoop
雲端計算作業 Hadoop Dockerfile 

## 使用方法
1. 安裝 Docker
2. 修改 本Repository 的 hadoop/slaves 檔案成自己要建立的 slaves 清單
3. 修改 本Repository 的 hadoop/hdfs-site.xml 內的 slaves 數量
4. Build Images
  ```
   ## 舉例，請自己修改
   # docker build -t "ssdoz2sk/hadoop-docker-homework:0.1"  .
  ```
5. 推送到 docker hub 方便每台部屬
5. 修改 start-master.sh 內的 自己的 Hostname 跟對應的 IP 還有 Docker Repository 名稱
6. 修改 start-slave.sh 內的 自己的 Hostname 跟對應的 IP 還有 Docker Repository 名稱
7. 先至每一台，除了 master 執行 `start-slave.sh <slave name>`
8. 最後到 master 執行 `master-slave.sh`

## 已知 BUG
* Master 的 Datanode 沒開啟成功
* Master 執行時出現一個錯誤，目前找不出由哪個 script 的問題
```
chown: missing operand after `/usr/local/hadoop/logs'
Try `chown --help' for more information.
```

## 附註
### 所有問題除了同組別同學外，不回應直到星期一課程結束
