azrg=lustre1
azloc=eastus
ADMINNAME=hongzhili

az group create --name $azrg --location $azloc

az network vnet create \
    --resource-group $azrg \
    --name $azrg-vnet \
    --address-prefix 192.168.0.0/16 \
    --subnet-name default \
    --subnet-prefix 192.168.0.0/16

az network nsg create \
    --resource-group $azrg \
    --name $azrg-nsg


MDSNAME=${azrg}-mds
az vm create --resource-group $azrg \
     --name $MDSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $MDSNAME \
     --private-ip-address 192.168.100.1 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 2048 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'



OSSNAME=${azrg}-oss01
az vm create --resource-group $azrg \
     --name $OSSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $OSSNAME \
     --private-ip-address 192.168.101.1 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 4096 4096 4096 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'


OSSNAME=${azrg}-oss02
az vm create --resource-group $azrg \
     --name $OSSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $OSSNAME \
     --private-ip-address 192.168.101.2 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 4096 4096 4096 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'



OSSNAME=${azrg}-oss03
az vm create --resource-group $azrg \
     --name $OSSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $OSSNAME \
     --private-ip-address 192.168.101.3 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 4096 4096 4096 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'



OSSNAME=${azrg}-oss04
az vm create --resource-group $azrg \
     --name $OSSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $OSSNAME \
     --private-ip-address 192.168.101.4 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 4096 4096 4096 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'


OSSNAME=${azrg}-oss05
az vm create --resource-group $azrg \
     --name $OSSNAME \
     --image OpenLogic:CentOS:7.7:7.7.20191209 \
     --public-ip-address-dns-name $OSSNAME \
     --private-ip-address 192.168.101.5 \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --storage-sku Premium_LRS \
     --data-disk-sizes-gb 4096 4096 4096 \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'



CLIENTNAME=${azrg}-client01
az vm create --resource-group $azrg \
     --name $CLIENTNAME \
     --image Canonical:UbuntuServer:18.04-LTS:18.04.201912180 \
     --public-ip-address-dns-name $CLIENTNAME \
     --location $azloc \
     --size Standard_D8s_v3 \
     --vnet-name $azrg-vnet \
     --subnet default \
     --nsg $azrg-nsg \
     --admin-username $ADMINNAME \
     --custom-data cloud_init_lustre_client.yaml \
     --generate-ssh-keys --authentication-type ssh --ssh-key-value 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDwSpI4Kn8m7LIeVjsry4n/M42dGdN0LpcoGsSY1QZSmSLzxxdmeYOwf1/gfEy4+YE5ccKdtCpMC8MvuFRe9wGsZCdtH8tC3SS+tDdw3KWh01SVbjubjCldMLH16p7zP1FhpYn/CKBtXrtbjw5CwdVs/elJvXYKJT5xbPOnqxoXBTvJQ3rqtIjgizmeH6O04ihOxzK/y4+2U1kZe/VRn12gbDNT4/kWR1hgLx81cVPVCndmOr8ZTqeMaqiIMN03yU5wOQqz1gZ7owMN2Ht/fWXdlW761ihXvBNIL5gz2KOZRbnoTO+sYgh09zdBEuK+W2RYuc+CzB2msZGXaO887BQycc73p1vNvHVL+hY5at3menQ5cOykTTGfDltf1baRCUcSch4A06/xpo3MCRATq8SVOuL+6aiNrUpRyDITyjo8FeM3osrd1+EvT+Mji9+QGIRYuSMkvsUts259vVgYf4PUe9SmzBQ4kJjPOvV8zkEulqwnLf1N3bBdUcp3cYzi2dqJycTMIAv4a2yeLwqFUSoJlnQK1Mv3yCQ4/Ktfr55UDhpF7Fj8liSwL05KJxO0bDIpZTUjpgjhdsoTwpuiHuOSGdCmO0pa7qGOOKspDZPzgwhrgy+xuC1iHeneg9c7syctiwCep2YHgDigZtn+c5W+E2hPhmkxYOvuUvwcy+RXIw== hongzl@microsoft.com'


