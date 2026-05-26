output "cache_cluster_id" {
  value = aws_elasticache_cluster.cache_cluster.id
}

output "cache_endpoint" {
  value = aws_elasticache_cluster.cache_cluster.cache_nodes[0].address
}

output "cache_port" {
  value = aws_elasticache_cluster.cache_cluster.cache_nodes[0].port
}
