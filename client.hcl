log_level = "DEBUG"

data_dir = "/home/nomad-data"

name = "s1-client"

client {
    enabled = true
    servers = ["<NODE_ID>:4647"]
}

ports {
    http = 5656
}