variable "project_id" {
  description = "The GCP project ID"
  
}

variable "location" {
  description = "The GCP region"
  
}

variable "zone" {
  description = "The GCP zone"
  
}


variable "env" {
  description = "The environment identifier (e.g., dev, prod)"
  type        = string
  
}




variable "buckets" {
  description = "Map of bucket configurations"
  type = map(object({
    
    location                = string
    storage_class           = string
    uniform_bucket_level_access = bool
    force_destroy           = bool
    versioning              = object({
      enabled = bool
    })
    logging = object({
      log_bucket        = string
      log_object_prefix = string
    })
    lifecycle_rule = list(object({
      action = object({
        type = string
      })
      condition = object({
        age                   = number
        created_before        = string
        with_state            = string
        matches_storage_class = list(string)
        num_newer_versions    = number
      })
    }))
    
  }))

}
