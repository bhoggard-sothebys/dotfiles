. ~/.secrets

export PATH=~/.config/emacs/bin:~/go/bin:/usr/local/bin:$PATH
source /opt/homebrew/share/zsh/site-functions

export HOMEBREW_NO_ENV_HINTS=true
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
# export VISUAL=code

# . $HOME/code/ws-monorepo/tools/sh/k8

eval "$(ssh-agent -s)"

function gogenerate() {
    bash -c "cd $1 && go generate -x" \;
    find $1 -type d \( ! -name . \) -exec bash -c "cd '{}' && go generate -x" \;
}

if [[ -f ~/code/ws-monorepo/env.sh ]]; then
    source ~/code/ws-monorepo/env.sh
fi

alias ch=chezmoi
alias db="aws_vikingdev && make ecr-login && ./deployment/scripts/database/start-db-and-migrate.sh deployment/database/client-information-db"
alias tp="telepresence quit && telepresence connect"
alias tf=terraform
alias tfs="tfswitch && terraform init"
alias stagingci="bazel run src/go/src/client-information/cmd/grpc_server:staging"
alias cienv="kubectl -n client-info exec deployment/client-information -c client-information-grpc-server -- env"
alias k=kubectl
alias dev="aws_vikingdev && k8 dev_developers"
alias staging="aws_vikingstaging && k8 staging_developers"
alias prod="export AWS_PROFILE=vikingprod_platform && k8 prod_platform"
alias kacct="kubectl -n account"
alias awslogin="aws_none && aws sso login"
