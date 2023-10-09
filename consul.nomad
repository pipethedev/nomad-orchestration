job "consul" {
    datacenters = ["dc1"]

    group "consul" {
        count = 1

        task "consul" {
            driver = "exec"

            config {
                command = "consul"
                args = ["agent", "-dev"]
            }

            artifact {
                source = "https://releases.hashicorp.com/consul/1.7.0/consul_1.7.0_linux_386.zip"
            }
        }
    }
}