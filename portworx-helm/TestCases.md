Test Cases:
|        Parameter            |                    Default                |
|-----------------------------|-------------------------------------------|
| --set deploymentType=docker, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 | http://install.portworx.com/?type=docker&c=mycluster&k=etcd:http://192.168.70.90:2379 |
| --set deploymentType=oci, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 | http://install.portworx.com/?type=oci&c=mycluster&k=etcd:http://192.168.70.90:2379 |
|-----------------------------|-------------------------------------------| 
| --set deploymentType=docker, openshiftInstall=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 |http://install.portworx.com/?type=dock&c=mycluster&k=etcd:http://192.168.70.90:2379&osft=true|
| --set deploymentType=oci, openshiftInstall=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 |http://install.portworx.com/?type=oci&c=mycluster&k=etcd:http://192.168.70.90:2379&osft=true|

| --set deploymentType=docker, isTargetOSCoreOS=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 |http://install.portworx.com/?type=dock&c=mycluster&k=etcd:http://192.168.70.90:2379&coreos=true|
| --set deploymentType=oci, isTargetOSCoreOS=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379 |http://install.portworx.com/?type=oci&c=mycluster&k=etcd:http://192.168.70.90:2379&coreos=true|

|--set deploymentType=docker, imageVersion=1.2.12.0, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379||
|--set deploymentType=oci, imageVersion=1.2.12.0, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379||

|--set deploymentType=docker,installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379, installOptions.runOnMaster=true | http://install.portworx.com/?type=dock&c=mycluster&k=etcd:http://192.168.70.90:2379&mas=true |
--set deploymentType=oci,installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379, installOptions.runOnMaster=true | http://install.portworx.com/?type=oci&c=mycluster&k=etcd:http://192.168.70.90:2379&mas=true |

|--set deploymentType=docker,installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379, installOptions.runOnMaster=true, installOptions.zeroStorage=true | http://install.portworx.com/?type=dock&c=mycluster&k=etcd:http://192.168.70.90:2379&mas=true&z=true |
|--set deploymentType=oci,installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379, installOptions.runOnMaster=true, installOptions.zeroStorage=true | http://install.portworx.com/?type=oci&c=mycluster&k=etcd:http://192.168.70.90:2379&mas=true&z=true |

--set deploymentType=oci, installOptions.usedrivesAndPartitions=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=oci, installOptions.usedrivesAndPartitions=true, installOptions.drives=/dev/sda,/dev/sdb, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=oci, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=AWS, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=oci, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=vault, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=oci, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=kvdb, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=oci, installOptions.secretType=vault, installOptions.lighthouse.token=1asdf3asdf2asdf, installOptions.etcd.credentials=abc:xyz, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379

--set deploymentType=docker, installOptions.usedrivesAndPartitions=true, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=docker, installOptions.usedrivesAndPartitions=true, installOptions.drives=/dev/sda,/dev/sdb, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=docker, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=AWS, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=docker, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=vault, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=docker, installOptions.kubernetesVersion=1.8.5, installOptions.secretType=kvdb, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
--set deploymentType=docker, installOptions.secretType=vault, installOptions.lighthouse.token=1asdf3asdf2asdf, installOptions.etcd.credentials=abc:xyz, installOptions.etcdEndPoint=etcd:http://192.168.70.90:2379
