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
    Set the maximum number of open files to 65535

Use 
```
    chmod +x setupOnUbuntu.sh
```
add
```
    source setupOnUbuntu.sh
```
to run this file.

 ![image](https://github.com/swbsin/SetFabricOnUbuntu/blob/master/result.PNG?raw=true)



    联系邮箱：swbsin@163.com
