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

    # registry {
    #   use "docker" {
    #     image = "example.com/my-app"
    #     tag   = gitrefpretty()
    #     local = true
    #   }
    # }
  }

  deploy {
    use "docker" {}
  }
}
