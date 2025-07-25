. ~/.secrets

export EDITOR=nvim
# export EDITOR='code --wait'
# export VISUAL=code

REPO_HOME=$HOME/code/ws-monorepo

if [[ -f $REPO_HOME/env.sh ]]; then
    source $REPO_HOME/env.sh
fi

alias awslogin="aws_none && aws sso login"
alias ch=chezmoi
alias cienv="kubectl -n client-info exec deployment/client-information -c client-information-grpc-server -- env"
alias db="aws_vikingdev && make ecr-login && ./deployment/scripts/database/start-db-and-migrate.sh deployment/database/client-information-db"
alias dev="aws_vikingdev && k8 dev_developers"
alias k=kubectl
alias prod_admin="export AWS_PROFILE=vikingprod_admin && k8 prod_platform"
alias prod="export AWS_PROFILE=vikingprod_platform && k8 prod_platform"
alias prodtoken="aws rds generate-db-auth-token --hostname $PROD_PARTY_DB_SERVER --port 5432 --region us-east-1 --username party_iam_service"
alias staging="aws_vikingstaging && k8 staging_developers"
alias stagingci="bazel run src/go/src/client-information/cmd/grpc_server:staging"
alias stagingtoken="aws rds generate-db-auth-token --hostname $STAGING_PARTY_DB_SERVER --port 5432 --region us-east-1 --username party_iam_service"
alias tf=terraform
alias tfs="tfswitch && terraform init"
alias tp="telepresence quit && telepresence connect"
