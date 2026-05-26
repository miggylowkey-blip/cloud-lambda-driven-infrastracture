resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name       = "cloud-event-cache-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "cache_cluster" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.node_count
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.cache_subnet_group.name
  port                 = var.port
}
