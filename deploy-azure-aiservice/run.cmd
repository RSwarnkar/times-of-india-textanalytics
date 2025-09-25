

az account clear
az login
# az account set --subscription "Your Subscription Name or ID"
az account set --subscription  
az account show


terraform init
terraform plan
terraform apply -auto-approve

terraform plan -destroy
terraform destroy -auto-approve

az account clear