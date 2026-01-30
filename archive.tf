data "archive_file" "terraform_code_archive" {
  type        = "tar.gz"
  output_path = "${path.module}/terraform-project.tar.gz"

  source_dir = path.module

  excludes = [
    ".git",
    ".terraform",
    "terraform.tfstate",
    "terraform.tfstate.backup",
    "*.tar.gz"
  ]
}
