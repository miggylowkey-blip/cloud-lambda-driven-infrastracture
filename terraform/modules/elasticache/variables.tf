variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group"
  type        = list(string)
}

variable "cluster_id" {
  description = "ElastiCache cluster ID"
  type        = string
  default     = "cloud-event-redis"
}

variable "node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t4g.micro"
}

variable "node_count" {
  description = "Number of ElastiCache nodes"
  type        = number
  default     = 1
}

variable "port" {
  description = "Redis port"
  type        = number
  default     = 6379
}
