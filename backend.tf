terraform {
    backend "s3" {
        bucket = "danilo-clc16-tfstate-618034445379-us-east-1-an"
        key    = "terraform/tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}