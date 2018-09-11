## CI-CD-Secure-Pipeline
You can download this and easily get sonarqube and jenkins up and running within minutes!  

### Dependencies
  * Git
  * docker
  * docker-compose

### Procedure
  0. You must have your own DNS entry and reachable from the internet.  You can use afraid DNS for free, and tell your firewall to forward ports to your docker containers.
  1. git clone "https://github.com/so87/CI-CD-Secure-Pipeline.git"
  2. cd CI-CD-Secure-Pipeline/
  3. ./build.sh
  4. follow my builds [here](https://github.com/so87/Home-Lab/blob/master/Configuration%20Guides.md) to configuring Jenkins and Sonarqube

### Archicture
Below is my high level process how I use this stack.  I have a CI build and a nightly build to deploy production.
<p align="center">
  <img width="1000" height="500" src="https://github.com/so87/Security-Lab-Manager/blob/dev/documentation/dev-deploy-process.PNG">
</p>

### Lets encrypt and proxy architecture
You could spin up other services behind this proxy easy and have the proxy companions request certs for you.
<p align="center">
  <img width="1500" height="500" src="https://github.com/evertramos/images/raw/master/webproxy.jpg">
</p>
