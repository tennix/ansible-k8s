# ansible ploybooks to deploy kubernetes cluster

## Requirements

control machine requirements:
* ansible: 2.2 or later
* python-netaddr

## Deploy k8s cluster

1. Modify inventory.ini and group_vars/all.yml to suit your need

2. Deploy all components

	```
	ansible-playbook deploy-cluster.yml
	```

	or one by one

	```
	ansible-playbook prepare.yml
	ansible-playbook deploy-etcd.yml
	ansible-playbook deploy-master.yml
	ansible-playbook deploy-node.yml
	ansible-playbook deploy-addons.yml
	```

3. To add more nodes after cluster is up and running, just add new
   nodes to inventory.ini and run

	```
	ansible-playbook deploy-node.yml
	```

If using password instead of ssh key to access remote machines, add
`-k` to all above commands. If the user on remote machin needs
password to execute `sudo` command, add `-K` to all above commands.

Eg. `ansible-playbook deploy-cluster.yml -k -K`

## Destroy k8s cluster

For testing purpose, we sometimes need to destroy k8s cluster and
redeploy. Just run following command to destroy the entire cluster.

```
ansible-playbook destroy.yml
```

*Note:* This will destroy kubernetes cluster permanently, think
carefully before running this command.

## Vagrant

If you do not have multiple machines, you can use vagrant to bring up multiple VMs.

1. Run `vagrant up` to bring up 3 VMs for testing

2. Run `vagrant ssh kube-master` to login to kube-master

3. Install ansible and python-netaddr on kube-master(control machine)

	```
	sudo add-apt-repository ppa:ansible/ansible
	sudo apt-get update && sudo apt-get install -y ansible python-netaddr
	```

4. Deploy kubernetes
   ```
   cd /vagrant
   ansible-playbook deploy-cluster.yml
   ```


## Limitations

* No support for HA masters
* No support for HA etcd clusters
* Only support calico network plugin
* Only ubuntu-14.04 tested
