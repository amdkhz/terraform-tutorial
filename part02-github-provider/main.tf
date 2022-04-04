# Adding terraform version and terraform provider version on Terraform block
# GitHub Provider Docs: https://registry.terraform.io/providers/integrations/github/latest/docs

terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.23.0"
    }
  }
}


provider "github" {
  # for more authentication ways and other configure options go to https://registry.terraform.io/providers/integrations/github/latest/docs#authentication

  token = "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"   # var.token
}


# Resources

# This resource allows you to create and manage repositories within your GitHub organization or personal account.
resource "github_repository" "my-new-repo" {
  name        = "my-new-repo"
  description = "My new repo description"
  auto_init = true

  visibility = "public"
}


# This resource allows you to create and manage files within a GitHub repository.
resource "github_repository_file" "my-new-repo" {
  repository          = "my-new-repo"
  branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}


# This resource allows you to create and manage branches within your repository.
resource "github_branch" "development" {
  repository = "my-new-repo"
  branch     = "new-branch"
}