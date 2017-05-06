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
* Master 執行時出現一個錯誤，目前找不出由哪個 script 的問題
```
chown: missing operand after `/usr/local/hadoop/logs'
Try `chown --help' for more information.
```

## 遇到的坑
1. sequenceiq/hadoop-docker 預設安裝會當做 master 並在本機開啟
  所以每一台開起來都要先關閉再修改，一怒之下就寫了個 Dockerfile
2. 每次 `docker run` Host 名稱都不一樣，為了統一、可辨識度高、及修改參數，增加 -h 參數，其他設定檔就不需再用script取代文字
3. Slave 名稱不可相同，於是寫了個小 script 去讓使用者指定 slave 的 Hostname
4. Dockerfile 內使用 run 去開啟 sshd 服務不知為何不可行、於是寫在 bootstrap.sh 內
5. master 原先會遇到 Namenode 開不起來 port 已被占用問題，但用 netstat 查詢無任何程式在使用
  使用 `$HADOOP_PREFIX/bin/hdfs namenode -format` 解決，不知為何
6. 尋找能讓 master 重新讀取 Datanode Live 的方式，每次重開實在太麻煩了

## 附註

1. 一個群集只能建一個 master
2. 防火牆請記得開洞
3. 其他的 WordCount 的 Code 自己打

### 所有問題除了同組別同學外，不回應直到星期一課程結束
