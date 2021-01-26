# Homebrew tap

## Use

### Install

Tap a formula repository:

    brew tap ilyar/software

Install software:

    brew install snort3
    brew install tokend-cli
    brew install tokend-hgate
    brew install whaler

### Upgrade

    brew upgrade

## Develop

### New Formula

Create new a formula see `brew create --help`, edit if need and test installation:

    brew install --verbose $(pwd)/Formula/$nameFormula.rb
