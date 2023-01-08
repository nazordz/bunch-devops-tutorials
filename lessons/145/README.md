## mentioned
###### LESSON do not rely sole on CPU and memory usage, your APP can degrade way before it reach 100%, measure golden signals
###### lesson evry devops should learn (load test your applicatin and detemine the treshhold whne you app will degraded and use them to autoscale do not use CPU oe memory)
###### very important lesson each devops or sre should learn

lesson to load test all together and measure golen signals as close to client as posible
if latency goes up it doesn't mean neccacary problem in the app it can be in ingress pods (they have to handle spikes in load and must be load tested along with application)
a lot of moving parts in k8s hard to debug and pintpoint the issue, it maybe problem in infra component not nessaary in your app. Espeasially when using meshes

k8s quality of service classes
talk about public and private ingresses and dns (route53)
explain how to expose services and cname records (show in aws consule private and public load balancers)
mentioned that you can manage DNS using ingress itself wihout terraform
combine visual graphics with code
how to deploy and configure jvm in container - https://www.merikan.com/2019/04/jvm-in-a-container/#java-10
(UseContainerSupport)
talk about linkerd

## Install linkerd

linkerd check --pre
linkerd check
linkerd viz dashboard


## Grafana
https://raw.githubusercontent.com/linkerd/linkerd2/main/grafana/values.yaml


















## Java
It sounds counterintuitive, but both -XX:MaxRAMPercentage and -XX:MinRAMPercentage are used to calculate maximum heap size when MaxHeapSize / -Xmx is not set:
https://stackoverflow.com/questions/54292282/clarification-of-meaning-new-jvm-memory-parameters-initialrampercentage-and-minr

The MinRAMPercentage parameter, unlike its name, allows setting the maximum heap size for a JVM running with a small amount of memory (less than 200MB).

k exec -it java-app-6848fdbbcd-xjj26 -c java-app -- sh

java -XX:+PrintFlagsFinal -version | grep -E "UseContainerSupport | InitialRAMPercentage | MaxRAMPercentage | MinRAMPercentage"

java -XshowSettings:vm -version


## Tests

k6 run java-app-1.js
k6 run go-app-1.js
