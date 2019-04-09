workflow "Test on push" {
  on = "push"
  resolves = ["test"]
}

action "xo" {
  uses = "stoe/xo-action@master"
  args = "install"
  secrets = ["GITHUB_TOKEN"]
}

action "build" {
  uses = "actions/npm@master"
  needs = ["xo"]
  args = "install"
}

action "test" {
  uses = "actions/npm@master"
  needs = ["build"]
  args = "test"
}
