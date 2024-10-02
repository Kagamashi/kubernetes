With this tool, you don’t have to make use of lengthy “kubectl config” commands to switch between contexts. This tool is particularly useful to switch context between clusters in a multi-cluster environment.
Installation:
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
Syntax:
To list all contexts:
kubectx
To switch to a new context:
kubectx
To switch back to the previous context:
kubectx –
To see the current context:
kubectx -c