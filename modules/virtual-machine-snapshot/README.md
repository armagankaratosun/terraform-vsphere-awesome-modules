# terraform-vsphere-awesome-modules/virtual-machine-snapshot 📸

Terraform sub-module for Virtual Machine Snapshots in vSphere/vCenter enviroment. An ideal use case may be to create snapshots over multiple virtual machines and remove them periodically.

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
then, you can simply create a main.tf file where you can define the snapshots;

```
module "snapshot" {
  source = "git::https://github.com/armagankaratosun/terraform-vsphere-awesome-modules.git//modules/virtual-machine-snapshot"

  vsphere_datacenter   = "<your-datacenter-name>" # Datacenter, by default.
  vm_name              = ["vm-to-be-snapshotted-01","vm-to-be-snapshotted-02"]
  snapshot_name        = ["snapshot-vm-to-be-snapshotted-01","snapshot-vm-to-be-snapshotted-02"]
  description          = "A nice and very informative description for the snapshots."
  memory               = true
  quiesce              = true
  remove_children      = false
  consolidate          = true
}
```
An example .tf file can be found under `examples` directory.


## Variables

| Name                        | Default Value                | Type   | Description                                    |
|-----------------------------|------------------------------|--------|------------------------------------------------|
| vsphere_datacenter          | null                         | string | Name of your datacenter in vSphere/vCenter, usually, it is 'Datacenter                                                                             |
| vm_name                     | null                         | string | The name of the virtual machine from which the snapshot will be taken. Can be a list of vm names to create snapshots of multiple virtual machines. |
| snapshot_name               | null                         | string | The name of the snapshot(s). Can be a list of names correspondign to the vm count.                                                                 |
| description                 | null                         | string | Description of the snapshot.                                                                                                                       |
| memory                      | true                         | bool   | Flag to indicate whether to capture the virtual machine's memory state.                                                                            |
| quiesce                     | true                         | bool   | Flag to indicate whether to quiesce the file system in the virtual machine.                                                                        |
| remove_children             | false                        | bool   | Flag to indicate whether to remove child snapshots when taking the snapshot.                                                                       |
| consolidate                 | true                         | bool   | Flag to indicate whether to consolidate the virtual machine's disk files.                                                                          |

## Requirements

* Terraform >= 1.3
* Terraform Provider for Vsphere >= 2.4.1


## License
This project is licensed under the GPL-3.0 license.