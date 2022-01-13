project = "pinball-highscore"

runner {
  enabled = true

  data_source "git" {
    url = "https://github.com/catsby/pinball.git"
  }
}

app "example-go" {
  labels = {
    "service" = "pinball-http"
  }

  build {
    use "pack" {}

    registry {
      use "aws-ecr" {
        repository = "catsby/pinball"
        tag   = gitrefpretty()
        region = "us-west-2"
      }
    }
  }

  deploy {
    use "docker" {}
  }
}
