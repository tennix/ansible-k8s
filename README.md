ansible, python-netaddr on control machine

# Deploy k8s cluster
modify inventory/hosts and inventory/group_vars/all.yml

deploy all components
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

To add more nodes after cluster is up and running, just add new nodes to inventory/hosts and run
```
ansible-playbook prepare.yml
ansible-playbook deploy-node.yml
```
