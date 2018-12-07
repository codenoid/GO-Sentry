<br>
<p align="center">
<img width="350" title="cubbie" alt="cubbie!" src="https://raw.githubusercontent.com/samueleaton/design/master/sentry.png">
</p>
<br>

# Sentry (GO Version) 🤖

![GitHub All Releases](https://img.shields.io/github/downloads/codenoid/GO-Sentry/total.svg)

Build/Runs your GO application, watches files, and rebuilds/reruns app on file changes, for Crystal version, visit [samueleaton/sentry](https://github.com/samueleaton/sentry)

## Installation

for Crystal installation, visit [this link](https://gist.github.com/codenoid/c9c172d6ab99c8de0130d940a3d9fe83) or [Official Site](https://crystal-lang.org/docs/installation/)

To install in your project, from the root directory of your project, run:
```bash
curl -fsSLo- https://raw.githubusercontent.com/codenoid/GO-Sentry/master/install.cr | crystal eval
```

**Troubleshooting the install:** This ruby install script is just a convenience. If it does not work, simply: (1) place the files located in the `src` dir into a your project in a `dev/` dir, and (2) compile sentry by doing `crystal build --release dev/sentry_cli.cr -o ./sentry`.

## Usage

Assuming `sentry.cr` was correctly placed in `[your project name]/dev/sentry.cr` and compiled into the root of your app as `sentry`, simply run:

```bash
./sentry [options]
```

### Options

#### Show Help Menu

```bash
./sentry --help
```

Example
```bash
$ ./sentry -h

Usage: ./sentry [options]
     -n NAME, --name=NAME             Sets the display name of the app process (default name: <your_app_here>)
     -b COMMAND, --build=COMMAND      Overrides the default build command
     --build-args=ARGS                Specifies arguments for the build command
     --no-build                       Skips the build step
     -r COMMAND, --run=COMMAND        Overrides the default run command
     --run-args=ARGS                  Specifies arguments for the run command
     -w FILE, --watch=FILE            Overrides default files and appends to list of watched files
     --no-color                       Removes colorization from output
     -i, --info                       Shows the values for build/run commands, build/run args, and watched files
     -h, --help                       Show this help
```

#### Override Default Build Command

```bash
./sentry -b "go build main.go"
```

The default build command is `go build main.go`. The release flag is omitted by default for faster compilation time while you are developing.

#### Override Default Run Command

```bash
./sentry -r "./main"
```

The default run command is `./[app_name]`.

#### Override Default Files to Watch

```bash
./sentry -w "./*.go" -w "./models/*.go"
```
The default files being watched are `["./*.go"]`.

#### Override Custom Watch, Build & Run Command

```bash
./sentry -w "./*.go" -w "./models/*.go" -b "go build main.go" -r "./main"
```

By specifying files to watch, the default will be omitted. So if you want to watch all of the file in your `src` directory, you will need to specify that like in the above example.

## Contributing

1. Fork it ( https://github.com/codenoid/GO-Sentry/fork )
2. Create your feature branch (git checkout -b feat-my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin feat-my-new-feature)
5. Create a new Pull Request

## Contributors

- [samueleaton](https://github.com/samueleaton) Sam Eaton - creator, maintainer
- [codenoid](https://github.com/codenoid) Codenoid - Fork maintainer

## Disclaimer

Sentry is intended for use in a development environment, where failure is safe and expected 😉.
