# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


  # cloud {
  #   workspaces {
  #     name = "learn-terraform-eks"
  #   }
  # }
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0, < 3.0.0"
    }
  }

  required_version = "~> 1.3"
}

