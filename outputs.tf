output "vm_names" {
  value = google_compute_instance.vm_instances[*].name
}

output "vm_ips" {
  value = google_compute_instance.vm_instances[*].network_interface[0].access_config[0].nat_ip
}

