# terraform-vsphere-awesome-modules 😎

Welcome to Armagan's Awesome Terraform Modules for Vsphere! This repository contains several sub-modules to effortlessly provision resources on Vcenter/Vsphere. Each sub-module has its own `README` file to thoroughly describe its usage and the variables it contains.

## 📂 Sub-modules

* virtual-machine 🖥️
* virtual-machine-snapshot 📸

## 🚀 Usage

### Step 1: Configure the Provider
First, you need to configure your provider by creating a `provider.tf` file with the following content:

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
### Step 2: Utilize the Sub-modules
Now, you can utilize the sub-modules to provision virtual machines and create virtual machine snapshots. Simply refer to the sub-modules like this:

```
module "vsphere_vm" {
  source = "git::https://github.com/armagankaratosun/terraform-vsphere-awesome-modules.git//modules/virtual-machine"
```
or

```
module "snapshot" {
  source = "git::https://github.com/armagankaratosun/terraform-vsphere-awesome-modules.git//modules/virtual-machine-snapshot"
```

Please take a look at each sub-module's README.md file for more details and variables. Additionally, example .tf files for each sub-module can be found under the examples directory.

### Step 3: Run Terraform

You can simply initiate terraform with `terraform init`, then run `terraform plan` and `terraform apply` to create your virtual machines and virtual machine snapshots.


## 🛠️ Requirements

* Terraform >= 1.3
* Terraform Provider for Vsphere >= 2.4.1


## 📜 License

This project is licensed under the GPL-3.0 license.

Feel free to contribute and add more awesome features! 🎉💪😊