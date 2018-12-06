require "option_parser"
require "colorize"
require "./sentry"

Sentry::Config.name = File.basename(Dir.current)

cli_config = Sentry::Config.new

OptionParser.parse! do |parser|
  parser.banner = "Usage: ./sentry [options]"
  parser.on(
    "-n NAME",
    "--name=NAME",
    "Sets the display name of the app process (default name: #{Sentry::Config.name})") { |name| cli_config.display_name = name }
  parser.on(
    "-b COMMAND",
    "--build=COMMAND",
    "Overrides the default build command") { |command| cli_config.build = command }
  parser.on(
    "--build-args=ARGS",
    "Specifies arguments for the build command") { |args| cli_config.build_args = args }
  parser.on(
    "--no-build",
    "Skips the build step") { cli_config.should_build = false }
  parser.on(
    "-r COMMAND",
    "--run=COMMAND",
    "Overrides the default run command") { |command| cli_config.run = command }
  parser.on(
    "--run-args=ARGS",
    "Specifies arguments for the run command") { |args| cli_config.run_args = args }
  parser.on(
    "-w FILE",
    "--watch=FILE",
    "Overrides default files and appends to list of watched files") do |file|
    cli_config.watch << file
  end
  parser.on(
    "--no-color",
    "Removes colorization from output") do
    cli_config.colorize = false
  end
  parser.on(
    "-i",
    "--info",
    "Shows the values for build/run commands, build/run args, and watched files") do
    cli_config.info = true
  end
  parser.on(
    "-h",
    "--help",
    "Show this help") do
    puts parser
    exit 0
  end
end

config = cli_config

if config.info
  if config.colorize?
    puts config.to_s.colorize.fore(:yellow)
  else
    puts config
  end
end

if Sentry::Config.name
  process_runner = Sentry::ProcessRunner.new(
    display_name: config.display_name!,
    build_command: config.build,
    run_command: config.run,
    build_args: config.build_args,
    run_args: config.run_args,
    should_build: config.should_build?,
    files: config.watch,
    colorize: config.colorize?
  )

  process_runner.run
else
  puts "🤖  Sentry error: 'name' not given"
  exit 1
end
