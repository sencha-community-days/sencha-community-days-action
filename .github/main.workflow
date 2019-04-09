workflow "Test on push" {
  on = "push"
  resolves = ["test"]
}

action "lint" {
  uses = "stoe/xo-action@master"
  args = "install"
}

action "build" {
  uses = "actions/npm@master"
  needs = ["lint"]
  args = "install"
}

action "test" {
  uses = "actions/npm@master"
  needs = ["build"]
  args = "test"
}
