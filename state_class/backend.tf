terraform {
  required_version = "0.11.14"
  backend "s3" {
    bucket = "state-class2-solongo"  ///This is bucket name
    key    = "path/to/my/key"        /// Where my file is
    dynamodb_table = "state_class"    /// LockId, it prevents overwriting on file 
    region = "us-east-1"
  }
}