variable "tags" {
    type = map
    default = {
        env="dev"
        costcenter="12345"
        classification="pbmm"
        owner="director.cloud@canada.ca"
        contact="tech.advisor@canada.ca"
        deployment="azure-lz-iac-2020-06-12"
    }
} 
variable "admin" {
    type = string
    default = "dhadmin"
}
variable "password" {
    type = string
    default = "Canada1!"
}
