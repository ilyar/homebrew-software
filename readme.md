# Homebrew tap

## Use

### Install

Tap a formula repository:

    brew tap ilyar/software

Install software:

    brew install tokend-cli
    brew install tokend-hgate

### Upgrade

    brew upgrade

## Develop

### New Formula

Create new a formula see `brew create --help`, edit if need and test installation:

    brew install --verbose $(pwd)/Formula/$nameFormula.rb
