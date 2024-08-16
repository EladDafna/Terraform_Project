variable "list_server" {
    description = "list of server names"
    type = list
    default = ["Elad_Server-1", "Elad_Server-2"]
}

variable "instance_type" {
    description = "type of instance"
    default = "t2.micro"

}
