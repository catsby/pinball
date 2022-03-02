project = "pinball-highscore"

runner {
  enabled = true

  data_source "git" {
    url = "https://github.com/catsby/pinball.git"
    ref = "refs/heads/dev"
  }
}

app "example-go" {
  labels = {
    "service" = "pinball-http"
  }

  build {
    use "pack" {}

    registry {
      use "docker" {
        local=true
        image    = "catsby/pinball"
        tag      = "latest"
      }
      # use "aws-ecr" {
      #   repository = "catsby/pinball"
      #   tag   = gitrefpretty()
      #   region = "us-west-2"
      # }
    }
  }

  deploy {
    use "kubernetes" {
      probe_path = "/"
      replicas = 1
    }
  }

  release {
    use "kubernetes" {
      // Sets up a load balancer to access released application
      load_balancer = true
      port          = 3000
    }
  }
}
