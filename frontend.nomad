job "frontend" {
    datacenters = ["dc1"]
    type = "service"

    group "frontend" {
        scaling {
            enabled = true
            min = 2
            max = 5
            policy {}
        }

        update {
            max_parallel = 1
            min_healthy_time = "5s"
            healthy_deadline = "30s"
            auto_revert = true
            auto_promote = true
            canary = 1
        }

        task "frontend" {
            driver = "docker"

            config {
                image = "<CONTAINER_IMAGE>"
            }

            env {
                PORT = "${NOMAD_PORT_http}"
            }

           resources {
                network {
                    port "http" {}
                }
           }

           service {
                name = "frontend"
                port = "http"

                tags = [
                    "frontend",
                    "urlprefix-/"
                ]

                checks {
                    type = "http"
                    path = "/"
                    interval = "5s"
                    timeout = "2s"
                }
           }
        }
    }
}