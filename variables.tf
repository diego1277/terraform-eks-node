variable cluster_name {
  description = "cluster name"
  type        = string
}

variable name {
  description = "node name"
  type        = string
}

variable node_version {
  description = "node version"
  type        = string
  default     = "1.24"
}

variable ssh_key_name {
  description = "ssh key name"
  type = string
  default = ""
}

variable generate_key_pair {
  description = "auto generate ssh key pair"
  type = bool
  default = true
}

variable subnets_id {
  description = "subnets id"
  type        = list(string)
}

variable desired_size {
  description = "size"
  type        = number
  default     = 1
}

variable max_size {
  description = "max instances"
  type        = number
  default     = 1
}

variable min_size {
  description = "min instances"
  type        = number
  default     = 1
}

variable capacity_type {
  description = "capacity type ON_DEMAND/SPOT"
  type        = string
  default     = "SPOT"
}

variable instance_types {
  description = "instace types"
  type        = list(string)
}

variable taints {
  description = "node taints"
  type = map(object({key=string,value=optional(string),effect=optional(string,"NO_SCHEDULE")}))
  default = {}
}

variable additional_tags {
  description = "additional tags"
  type = map(any)
  default = {}
}

variable node_group {
  description = "node group configuration"
  type        = string
  default     = {}
}
