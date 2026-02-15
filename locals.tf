locals {

  web_instance_name = "web-${var.project_name}-${var.environment}"
  db_instance_name  = "db-${var.project_name}-${var.environment}"
  
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }

  metadata = {
    serial-port-enable = var.metadata["serial-port-enable"]
    ssh-keys           = "${var.metadata["ssh-keys"]}${var.vms_ssh_root_key}"
  }
}
