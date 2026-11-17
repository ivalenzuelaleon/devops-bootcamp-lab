terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

# Lee automáticamente tus credenciales desde ~/.oci/config
provider "oci" {
  
}

# Crea una VCN en tu Compartment raíz (Tenancy)
resource "oci_core_vcn" "vcn_devops" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaaqglzxrhdle6ij2fhymdyu6gabl4eoipfrakfic4fbugqi4blrk6a"
  display_name   = "vcn-lab-devops-terraform"
  dns_label      = "labdevops"
}

output "id_vcn_creada" {
  value = oci_core_vcn.vcn_devops.id
}
