return {
  keys = require('configuration.keys'),
  apps = require('configuration.apps'),
  update_interval = 10,
  timeout = 2,
  collectgarbage("collect"),
  collectgarbage("step", 42)
}
