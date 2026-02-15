#instance_name
#external_ip
#fqdn

output "task_4_output" {

  value = [
    { dev1 = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform.network_interface[0].nat_ip_address}", 
        yandex_compute_instance.platform.name,
        yandex_compute_instance.platform.network_interface[0].ip_address,
        yandex_compute_instance.platform.fqdn
      ]      
 },
    { dev2 = [
        "ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform_db.network_interface[0].nat_ip_address}", 
        yandex_compute_instance.platform_db.name,
        yandex_compute_instance.platform_db.network_interface[0].ip_address,
        yandex_compute_instance.platform_db.fqdn
      ]
    }
  ]
}
