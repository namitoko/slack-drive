module "slack_drive_cloud" {
  source            = "amancevice/slack-drive/google"
  version           = "0.1.2"
  app_version       = "0.1.0"
  bucket_name       = "${var.bucket_name}"
  cloud_credentials = "${file("client_secret.json")}"
  cloud_project     = "${var.cloud_project}"
  cloud_region      = "${var.cloud_region}"
}

variable "bucket_name" {
  description = "Cloud Storage bucket for storing Cloud Function code archives."
  //default     = "my-project-slack-drive"
}

variable "cloud_project" {
  description = "The ID of the project to apply any resources to."
  //default     = "my-project-123456"
}

variable "cloud_region" {
  default = "us-central1"
}

output "event_pubsub_topic" {
  value = "${module.slack_drive_cloud.event_pubsub_topic}"
}

output "event_subscriptions_url" {
  value = "${module.slack_drive_cloud.event_subscriptions_url}"
}

output "redirect_url" {
  value = "${module.slack_drive_cloud.redirect_url}"
}

output "slash_command_url" {
  value = "${module.slack_drive_cloud.slash_command_url}"
}