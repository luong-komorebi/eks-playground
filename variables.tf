variable "project_name" {
  type        = string
  description = "playground eks"
  default     = "playground-eks"
  validation {
    # check the length of the string and ensure it does not contain spaces
    # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
    condition = (
      length(var.project_name) > 4 &&
      length(var.project_name) < 32 &&
      replace(var.project_name, " ", "") == var.project_name
    )

    error_message = "The project_name must be between 4 and 32 characters and may not contain spaces."
  }
}

variable "region" {
  type        = string
  default     = "us-west-2"
}

variable "cluster_version" {
  type        = string
  default     = "1.21"
}

variable "cluster_instance_type" {
  type        = string
  default     = "m5.large"
}
variable "cluster_asg_desired_capacity" {
  type        = number
  default     = 3
}

# autoscaling max
variable "cluster_asg_max_size" {
  type        = number
  default     = 5
}

variable "cluster_enabled_log_types" {
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "cluster_write_kubeconfig" {
  type        = bool
  description = "Specify if Terraform sound output the Kubernetes configuration file. "
  default     = false
}

variable "cidr" {
  type        = string
  description = "The CIDR block to use for this demo"
  default     = "10.0.0.0/16"
}
