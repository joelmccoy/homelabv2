locals {
  random_suffix = random_string.suffix.result
  hostname      = "github-actions-runner-${local.random_suffix}"
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "proxmox_virtual_environment_container" "github_actions_runner" {
  description = "Github Actions Runner ${local.random_suffix}"
  vm_id       = var.vmid

  node_name = var.proxmox.name

  initialization {
    hostname = local.hostname

    ip_config {
      ipv4 {
        address = "${var.ip_address}${var.ip_mask}"
        gateway = var.gateway
      }
    }

    user_account {
      keys = [
        trimspace(tls_private_key.github_actions_runner_key.public_key_openssh)
      ]
      password = random_password.github_actions_runner_password.result
    }
  }

  network_interface {
    name = var.network_interface
  }

  disk {
    datastore_id = var.datastore_id
    size         = var.disk_size
  }

  cpu {
    cores = var.cpu_cores
  }

  console {
    type = "shell"
  }

  memory {
    dedicated = var.memory_mb
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_download_file.ubuntu_lxc_template.id
    type             = "ubuntu"
  }

  startup {
    order      = var.startup_order
    up_delay   = var.startup_up_delay
    down_delay = var.startup_down_delay
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_lxc_template" {
  content_type = "vztmpl"
  datastore_id = "local"
  node_name    = var.proxmox.name
  url          = var.template_url
}

resource "random_password" "github_actions_runner_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

resource "tls_private_key" "github_actions_runner_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.github_actions_runner_key.private_key_pem
  filename = abspath("${path.root}/github_actions_runner_${local.random_suffix}.generated_key.pem")

  provisioner "local-exec" {
    command = "chmod 600 ${self.filename}" # Secure the private key
  }
}

locals {
  install_gh_runner_script_path = "${path.module}/templates/install-gh-runner.sh"
}

resource "null_resource" "setup_github_actions_runner" {
  depends_on = [
    proxmox_virtual_environment_container.github_actions_runner,
  ]

  # First connection to write the token to a file (output suppressed due to sensitive value)
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.ip_address
      user        = "root"
      private_key = tls_private_key.github_actions_runner_key.private_key_pem
    }

    inline = [
      "echo '${var.gh_runners_pat}' > /tmp/github_token",
      "chmod 600 /tmp/github_token"
    ]
  }

  # Second connection to run the actual script (output visible)
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.ip_address
      user        = "root"
      private_key = tls_private_key.github_actions_runner_key.private_key_pem
    }

    inline = [
      file(local.install_gh_runner_script_path)
    ]
  }

  triggers = {
    script = filesha256(local.install_gh_runner_script_path)
  }
}
