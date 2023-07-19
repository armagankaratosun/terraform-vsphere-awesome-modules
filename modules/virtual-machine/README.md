# terraform-vsphere-awesome-modules/virtual-machine 🖥️

Terraform sub-module for creating Virtual Machine(s) in vSphere/vCenter environment. An ideal use case may be to create multiple virtual machines and manage their life cylce via Terraform.

## Usage

You first need to configure your provider via creating a provider.tf file

```
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.1"
    }
  }
}

provider "vsphere" {
    vsphere_server = "https://<vcenter-or-vsphere-url>"
    user = "<your-username>"
    password = "<your-password>"
    allow_unverified_ssl = true # allow insecure (self-signed) certificates.
}
```
then, you can simply create a main.tf file where you can define Virtual Machine(s);

```
module "vsphere_vm" {
  source  = "armagankaratosun/awesome-modules/vsphere//modules/virtual-machine"
  version = "0.1.0"

  vsphere_datastore = "<your-datastore>"
  vsphere_datacenter = "<your-datacenter>"
  vsphere_compute_cluster = "<your-cluster>"
  vsphere_networks = ["vlan-0", "vlan-10"]
  
  vm_name = ["vm-1", "vm-2"]
  vsphere_virtual_machine_template = "<your-vm-template>"
  vm_volumes = {
    boot = {
        label = "disk0"
        size  = 30
        thin_provisioned = false
        unit_number      = 0

    }
    data = {
        label = "disk1"
        size = 100
        thin_provisioned = true
        unit_number      = 1

    }
  }
  cloud_init_data = file("<path-to-your-cloud-init-yaml>")
}
```
An example .tf file can be found under `examples` directory.


## Variables

| Name                              | Default Value                | Type   | Description                                    |
|-----------------------------------|------------------------------|--------|------------------------------------------------|
| vsphere_datacenter                | null                         | string         | Name of your datacenter in vSphere/vCenter, usually, it is 'Datacenter                                                                             |
| vsphere_datastore                 | null                         | string         | Name of your datastore that you want to create volumes in.                                                                                         |
| vsphere_compute_cluster           | null                         | string         | Name of the compute cluster that you want to provision VMs.                                                                                        |
| vsphere_virtual_machine_template  | null                         | string         | Virtual machine template that you initialy use to clone for your VM.                                                                               |
| vsphere_networks                  | null                         | list (string)  | List of your availabe networks in vSphere/vCenter. There should be at least one network.                                                           |
| vm_name                           | null                         | list (string)  | The name of the virtual machine(s)                                                                                                                 |
| vm_volumes                        | null                         | map  (object)  | List of virtual machine volumes, there should be at least one (boot) volume with unit_number = 0.                                                  |
| vm_num_cpus                       | 2                            | number         | Number of cores for your virtual machine, gives you two cores by default.                                                                          |
| vm_memory                         | 2048                         | number         | Amount of RAM for your virtual machine, gives you two gigabyte of RAM by default.                                                                  |
| cloud_init_data                   | null                         | string         | User-input for cloud init, provide a full path for cloud-init.yaml file.                                                                           |

## Requirements

* Terraform >= 1.3
* Terraform Provider for Vsphere >= 2.4.1
