provider "aws" {
    region = "ap-south-1"
  alias = "southregion"
}
provider "aws" {
  region="us-west-1"
  alias = "westregion"
}