# Portworx

[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

## Introduction
The helm chart (portworx-helm) deploys Portworx and STork(https://docs.portworx.com/scheduler/kubernetes/stork.html) on your Kubernetes cluster. The minimum requirements for deploying the helm chart are as follows:

- Helm has been installed on the client machine from where you would install the chart. (https://docs.helm.sh/using_helm/#installing-helm)
- Tiller is running on the Kubernetes cluster where you wish to deploy Portworx. 
- Tiller has been provided with the right RBAC permissions for the chart to be deployed correctly. 

Provide tiller the right RBAC permissions. Portworx pre and post delete hooks use the service account name as `tiller` to clean up resources.
```
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

## Prerequisites

- Kubernetes 1.7+
- All [Pre-requisites](https://docs.portworx.com/#minimum-requirements). for Portworx fulfilled. 

## Installing the Chart


To install the chart with the release name `my-release` run the following commands substituting relevant values for your setup:

##### NOTE: 
`etcdEndPoint` is a required field. The chart installation would no proceed unless provided with this option. provide the etcd endpoint  
`clusterName` should be a unique name identifying your Portworx cluster. The default value is `mycluster`, but it is suggested to update it with contextual to your requirement.  

For eg: 
```
git clone https://github.com/portworx/helm.git
helm install --debug --name my-release --set etcdEndPoint=etcd:http://192.168.70.90:2379,clusterName=$(uuid) ./helm/charts/px/
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:
The chart would follow the process as outlined here. (https://docs.portworx.com/scheduler/kubernetes/install.html#uninstall)
Also please 
##### NOTE:
the Portworx configuration files under /etc/pwx/ directory are preserved, and will not be deleted.

```
helm delete my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Datadog chart and their default values.

|             Parameter       |            Description             |                    Default                |
|-----------------------------|------------------------------------|-------------------------------------------|
| `deploymentType`            | The deployment type. Can be either docker/oci   | `oci`                 |
| `imageVersion`              | The image tag to pull              | `latest`                                  |
| `openshiftInstall`               | Installing on Openshift? | `false`                               |
| `isTargetOSCoreOS`        | Is target CoreOS       | `false`                                     |
| `etcdEndpoint`          | (REQUIRED) ETCD endpoint for PX to function properly in the form "etcd:http://<your-etcd-endpoint>" | `etcd:http://<your-etcd-endpoint>`                    |
| `clusterName`           | Portworx Cluster Name  | `mycluster`                                     |
| `usefileSystemDrive`      | Should Portworx use an unmounted drive even with a filesystem ? | `false`                |
| `usedrivesAndPartitions`  | Should Portworx use the drives as well as partitions on the disk ? | `false`             | 
| `secretType`      | Secrets store to be used can be AWS/KVDB/Vault          | `none`                                    |
| `drives` | Comma seperated list of drives to be used for storage           | `none`                                   |
| `dataInterface`   | Name of the interface <ethX>             | `none`                                   |
| `managementInterface`   | Name of the interface <ethX>             | `none`                                   |
| `envVars`  | Colon-separated list of environment variables that will be exported to portworx. (example: API_SERVER=http://lighthouse-new.portworx.com:MYENV1=val1:MYENV2=val2) | `none`                                    |
| `stork`    | Storage Orchestration for Hyperconvergence.     | `true`       |
| `etcd.credentials`  | Username and password for ETCD authentication in the form user:password | `none:none`                                    |
| `etcd.ca`  | Location of CA file for ETCD authentication. Should be /path/to/server.ca | `none`                                    |
| `etcd.cert`  | Location of certificate for ETCD authentication. Should be /path/to/server.crt | `none`                                    |
| `etcd.key`  | Location of certificate key for ETCD authentication Should be /path/to/servery.key | `none`                                    |
| `etcd.acl`  | ACL token value used for Consul authentication. (example: 398073a8-5091-4d9c-871a-bbbeb030d1f6) | `none`                                    |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

##### NOTE: 
    In this case the chart is located at `./helm/charts/px`, do change it as per your setup. 
```
helm install --name my-release --set deploymentType=docker,imageVersion=1.2.12.0,etcdEndPoint=etcd:http://192.168.70.90:2379 ./helm/charts/px/
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```
helm install --name my-release -f values.yaml ./helm/charts/px
```
> **Tip**: You can use the default [values.yaml](values.yaml)


### Basic debugging. 

``` 
helm install --dry-run --debug --set etcdEndPoint=etcd:http://192.168.70.90:2379,clusterName=$(uuid) ./helm/charts/px/
[debug] Created tunnel using local port: '37304'
[debug] SERVER: "127.0.0.1:37304"
[debug] Original chart version: ""
[debug] CHART PATH: /root/k8s-helm-dev/helm/charts/px

Error: no available release name found
```
This most likely indicates that Tiller doesnt have the right RBAC permissions.
Verify the tiller logs 

[storage/driver] 2018/02/07 06:00:13 get: failed to get "singing-bison.v1": configmaps "singing-bison.v1" is forbidden: User "system:serviceaccount:kube-system:default" cannot get configmaps in the namespace "kube-system"
[tiller] 2018/02/07 06:00:13 info: generated name singing-bison is taken. Searching again.
[tiller] 2018/02/07 06:00:13 warning: No available release names found after 5 tries
[tiller] 2018/02/07 06:00:13 failed install prepare step: no available release name found

Follow the steps mentioned in the pre-requisites to provide the right RBAC permissions to the serviceaccount running tiller. 