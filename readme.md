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
