. ~/.secrets

export PATH=~/.config/emacs/bin:~/go/bin:/usr/local/bin:$PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
source /opt/homebrew/share/zsh/site-functions
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH=~/bin:$PATH

export HOMEBREW_NO_ENV_HINTS=true
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=nvim
# export EDITOR='code --wait'
# export VISUAL=code

eval "$(ssh-agent -s)"

function gogenerate() {
    go install github.com/golang/mock/mockgen@v1.6.0
    mockgen -package mock -destination mock/mock.go .
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
alias prod_admin="export AWS_PROFILE=vikingprod_admin && k8 prod_platform"
alias kacct="kubectl -n account"
alias awslogin="aws_none && aws sso login"
alias stagingtoken="aws rds generate-db-auth-token --hostname party-db-staging.cbpre07cru6l.us-east-1.rds.amazonaws.com --port 5432 --region us-east-1 --username party_iam_service"
alias prodtoken="aws rds generate-db-auth-token --hostname party-db-prod.cnykxfctcmn9.us-east-1.rds.amazonaws.com --port 5432 --region us-east-1 --username party_iam_service"
alias getid="aws sts get-caller-identity"
alias prodtoken="aws rds generate-db-auth-token --hostname party-db-prod.cnykxfctcmn9.us-east-1.rds.amazonaws.com --port 5432 --region us-east-1 --username party_iam_service"

export AUTOENV_ENABLE_LEAVE=true
source /opt/homebrew/opt/autoenv/activate.sh
