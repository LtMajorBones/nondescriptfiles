

# USAGE: add-cluster.sh <CLUSTER_NAME_IN_AZURE>
# USAGE: add-cluster.sh aks-pbmcorespkprbtsdev000

az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET  --tenant $ARM_TENANT_ID --output none

az account set -s $3

az aks get-credentials -n $1 -g $2 --admin --file kubeconfig

argocd cluster add $1-admin --name $1  --kubeconfig kubeconfig --server argocd-aks.apps.pococp-int-aetw.aetna.com  --insecure    --auth-token $ARGOCDTOKEN



chmod 400 id_rsa_argocd

GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=no -i id_rsa_argocd' git clone git@github.aetna.com:ContainerEng/aks.git

cd aks

ls

mkdir $1

cat << EOF > $1/$1-gitops.yaml
# This manifest should be deployed to the ArgoCD/GitOps instance as part of the new cluster onboarding process.
# This does NOT get deployed to the new cluster itself!
---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  # Change Name to <CLUSTER_NAME>-gitops
  name: $1-gitops
  namespace: argocd-aks
spec:
  destination:
    namespace: argocd-aks
    # Leave the server where ArgoCD/Gitops is running
    server: https://api.pococp-int-aetw.aetna.com:6443
  project: default
  source:
    helm:
      valueFiles:
        # Change values path to ../../<CLUSTER_NAME>/values.yaml
        - ../../$1/values.yaml
    path: base-config/argocd-applicationsets
    repoURL: git@github.aetna.com:ContainerEng/aks
    targetRevision: HEAD
EOF

cat << EOF > $1/values.yaml
clusterName: $1
EOF

ls
git config user.name "Jenkins"
git config user.email "jenkins@example.com"
git add .
git commit -am "adding new cluster $1"
GIT_SSH_COMMAND='ssh -o StrictHostKeyChecking=no -i ../id_rsa_argocd'  git push origin master

cd ..

