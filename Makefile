all: create-cluster test-workflow

SHELL := /bin/bash
flow  := diamond.yaml

create-cluster:
	source helpers && create_cluster

test-workflow:
	kubectl --kubeconfig .kubeconfig create -f $(flow)
	source helpers && check_workflow

port-forward:
	source helpers && setup_forward

drop-cluster:
	source helpers && drop_cluster

update:
	source helpers && update
