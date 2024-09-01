

output "url_bucket" {
  description = "URL of the bucket"
  value       = [for bucket in google_storage_bucket.buckets: bucket.self_link]
}
