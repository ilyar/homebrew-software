# Homebrew tap

It is Homebrew tap for binary bottles are currently available only for `x86-64 Linux`.

## FAQ

1. [What does brew tap mean?](https://docs.brew.sh/Taps)

[You can ask a question](https://github.com/tonsoft/homebrew-stable/issues/new?labels=question&template=question.md) in any language (do not limit yourself, for example use Esperanto).

## Use

### Install

Tap a formula repository:

    brew tap ilyar/software

List software:

    brew tap-info ilyar/software --json | jq -r '.[]|(.formula_names[])'

### Upgrade

    brew upgrade

### Remove a tap

    brew untap ilyar/software

## Develop

### Create new a formula

For help see `brew create --help` and [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook).

    brew create --tap ilyar/software --set-name new-formula-name URL

### Edit if need and testing

    code $(brew --repository ilyar/software)/Formula/new-formula-name.rb
    brew style ilyar/software
    brew audit --tap=ilyar/software
    brew install new-formula-name

### Create PR

    cd $(brew --repository ilyar/software)
    git remote add self fork
    git checkout -b add-new-formula-name
    git add Formula/new-formula-name.rb
    git commit -m "feat: add new-formula-name"
    git push self add-new-formula-name
