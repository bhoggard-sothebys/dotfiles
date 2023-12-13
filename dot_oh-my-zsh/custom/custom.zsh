. ~/.secrets

export GOPATH=$HOME/code/ws-monorepo/bazel-ws-monorepo/external
export GOROOT=$GOPATH/go_sdk
export PATH=$GOPATH/bin:/usr/local/bin:$PATH

export HOMEBREW_NO_ENV_HINTS=true
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
# export VISUAL=code

. $HOME/code/ws-monorepo/tools/sh/k8

eval "$(ssh-agent -s)"

function gogenerate() {
    bash -c "cd $1 && go generate -x" \;
    find $1 -type d \( ! -name . \) -exec bash -c "cd '{}' && go generate -x" \;
}

aws_vikingprod() {
    export AWS_PROFILE=viking_prod
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingregistrationprod() {
    export AWS_PROFILE=viking_registrationprod
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingstaging() {
    export AWS_PROFILE=viking_dev
    export AWS_REGION=us-east-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_vikingdev() {
    export AWS_PROFILE=viking_dev
    export AWS_REGION=eu-west-1
    export AWS_DEFAULT_REGION=$AWS_REGION
}

aws_none() {
    unset AWS_PROFILE AWS_REGION AWS_DEFAULT_REGION
}

alias ch=chezmoi
alias db="./deployment/scripts/database/start-db-and-migrate.sh deployment/database/client-information-db"
