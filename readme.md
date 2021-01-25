# Homebrew tap

    brew tap ilyar/software

## New Formula

Create new a formula:

    nameFormula=new-tool
    brew create --autotools --set-name $nameFormula https://github.com/users/repo/archive/version.tar.gz
    mv $(brew --repository)/Library/Taps/homebrew/homebrew-core/Formula/$nameFormula.rb ./Formula/$nameFormula.rb

Edit if need and test installation:

    brew install $(pwd)/Formula/$nameFormula.rb
