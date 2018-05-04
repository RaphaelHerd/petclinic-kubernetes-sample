mkdir -p keys
ssh-keygen -f keys/id_k8s-key -t rsa -N ''

kops create cluster k8s-clusters.digital-cloud-test.de \
  --state s3://kubernetes-aws-io-rapherd \
  --node-count 3 \
  --cloud=aws \
  --zones=eu-central-1a,eu-central-1b,eu-central-1c \
  --node-size t2.xlarge \
  --master-size t2.xlarge \
  --master-count 3 \
  --networking canal \
  --topology private \
  --ssh-public-key keys/id_k8s-key.pub \
  --bastion="true" \
  --dns-zone=Z3QYRLZU04ATEC \
  --api-loadbalancer-type="public" \
  --yes
