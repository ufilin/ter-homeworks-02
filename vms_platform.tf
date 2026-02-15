###cloud vars
/*

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
*/

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_db" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "develop_1"
  description = "VPC network & subnet name"
}

###task 2 vars

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "https://cloud.yandex.ru/docs/compute/operations/images-with-versions"
}
/*
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}
*/
  variable "vm_db_platform-id" {
    type        = string
    default     = "standard-v1"
    description = "https://cloud.yandex.ru/docs/compute/operations/images-with-versions"
  }
  /*
  variable "vm_db_cores" {
    type        = number
    default     = 2
    description = "Number of cores"
  }
  variable "vm_db_memory" {
    type        = number
    default     = 2
    description = "Memory in GB"
  }
  variable "vm_db_core-fraction" {
    type        = number
    default     = 20
    description = "Core fraction"
  }  
  */
  variable "vm_db_should_be_preemptible" {
    type        = bool
    default     = true
    description = "Should the VM be preemptible"
  }
  variable "vm_db_subnet_nat" {
    type        = bool
    default     = true
    description = "Should the VM have NAT"
  }
  /*
  variable "vm_db_serial-port-enable" {
    type        = number
    default     = 1
    description = "Should the serial port be enabled"
  }
  */

###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFBRamD0H9k5l+9THsgwOK1aB2PqpUXf+nHcVjZhfgSt root@debian"
  description = "ssh-keygen -t ed25519"
}
*/