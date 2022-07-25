# azure-iac
Playground of azure IAC + Ansible


# To init:
- **Locally**:
    - Change the value of `source_address_prefix` in `azure-iac\terraform\terraform.tfvars`
        - example: `source_address_prefix = "192.168.1.2/32"`
    - Change the ip of `ansible_host` in `azure-iac\terraform\ansible\inventory.yaml`
        - example: `ansible_host: 1.2.3.4`
- **VM**:
    - Run the following [script](https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1) as **Powershell (Administrator)**
