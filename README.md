# SetFabricOnUbuntu
set up hyperledger/fabric on Ubuntu

Development on Ubuntu is done on the native OS, not in Vagrant. This script can be
used to set up on Ubuntu, similar to devenv/setup.sh which does the
same for Vagrant.
See https://github.com/hyperledger/fabric/blob/master/docs/dev-setup/install.md

To make building on Ubuntu easier and faster, this script is provided.Thus you can deploy fabric on AWS,aliyun,and so on.
This script install the follow prerequisites:

    Git client
    Go - 1.6 or later
    RocksDB version 4.1 and its dependencies
    Docker
    Pip
    Set the maximum number of open files to 65535 or greater for your OS

You can use 
    ```source setupOnUbuntu.sh``` 
to run this file.

 ![image](https://github.com/swbsin/SetFabricOnUbuntu/blob/master/result.PNG?raw=true)

ad:
    zju14级小硕，浙大blockchain项目组攻坚者与技术核心，明年3月份毕业，求一份与区块链相关的工作:)
    对以太坊有一定积累，解决了如何在以太坊私链的多节点上部署智能合约及自动化部署节点，并实现对节点的监控，现长期关注hyperledger项目。
    联系邮箱：swbsin@163.com
