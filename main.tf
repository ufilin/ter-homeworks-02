resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.web_instance_name
  platform_id = var.vm_web_platform-id
  allow_stopping_for_update = var.allow_stopping_for_update
  resources {
    cores         = var.vms_resources["web"]["cores"]
    memory        = var.vms_resources["web"]["memory"]
    core_fraction = var.vms_resources["web"]["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.vms_resources["web"]["hdd_size"]
      type = var.vms_resources["web"]["hdd_type"]
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_should_be_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_subnet_nat
  }

  metadata = local.metadata
}

## second VM

resource "yandex_vpc_network" "develop_1" {
  name = var.vm_db_vpc_name
}
resource "yandex_vpc_subnet" "develop_1" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop_1.id
  v4_cidr_blocks = var.default_cidr_db
}

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_family
}
resource "yandex_compute_instance" "platform_db" {
  name        = local.db_instance_name
  platform_id = var.vm_db_platform-id
  zone = var.vm_db_default_zone
  allow_stopping_for_update = var.allow_stopping_for_update

  resources {
    cores         = var.vms_resources["db"]["cores"]
    memory        = var.vms_resources["db"]["memory"]
    core_fraction = var.vms_resources["db"]["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
      size = var.vms_resources["db"]["hdd_size"]
      type = var.vms_resources["db"]["hdd_type"]
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_should_be_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_1.id
    nat       = var.vm_db_subnet_nat
  }

  metadata = local.metadata
}