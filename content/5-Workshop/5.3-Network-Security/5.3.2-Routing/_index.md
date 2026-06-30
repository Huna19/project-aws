---
title : "Routing & NAT Gateways"
date : 2024-01-01
weight : 2
chapter : false
pre : " <b> 5.3.2. </b> "
---

### Routing & NAT Gateways

In this section, we will configure the Internet Gateway, NAT Gateways, and Route Tables to direct network traffic for the Subnets.

---

#### 1. Configure Internet Gateway & NAT Gateways

To allow instances in the Private Subnets to connect to the internet to download packages while keeping them private, we need a NAT Gateway.

1. **Create Internet Gateway (IGW)**:
   * On the left navigation, select **Internet gateways** -> click **Create internet gateway**.
   * **Name tag**: Enter ```ticket-app-igw``` -> click **Create internet gateway**.
   * Once created, click **Actions** -> select **Attach to VPC**.
   * Select the ```ticket-app-vpc``` VPC -> click **Attach internet gateway**.

![Attach IGW](/images/5-Workshop/5.3-Network-Security/attach_igw.png)

2. **Allocate Elastic IPs**:
   * Select **Elastic IPs** -> click **Allocate Elastic IP address**.
   * Click **Allocate** (Repeat this step 2 times to get 2 static IPs for the 2 NAT Gateways).

3. **Initialize NAT Gateways**:
   * Select **NAT gateways** -> click **Create NAT gateway**:
     * **Name**: ```ticket-app-nat-gateway-a```
     * **Subnet**: Select ```ticket-app-subnet-public-a``` (Must reside in a Public Subnet).
     * **Elastic IP allocation ID**: Select the first EIP address.
     * Click **Create NAT gateway**.
   * Click **Create NAT gateway** again to create the second one:
     * **Name**: ```ticket-app-nat-gateway-b```
     * **Subnet**: Select ```ticket-app-subnet-public-b```.
     * **Elastic IP allocation ID**: Select the second EIP address.
     * Click **Create NAT gateway**.

![NAT Gateway Create](/images/5-Workshop/5.3-Network-Security/create_nat.png)

---

#### 2. Configure Route Tables

We need to separate the routing paths for Public Subnets (via Internet Gateway) and Private Subnets (via NAT Gateways).

1. **Public Route Table**:
   * Select **Route tables** -> click **Create route table**.
   * **Name**: ```ticket-app-public-rt``` -> Select the VPC ```ticket-app-vpc``` -> click **Create**.
   * Select the ```ticket-app-public-rt``` Route Table -> Select the **Routes** tab -> click **Edit routes**:
     * Click **Add route**: Destination ```0.0.0.0/0``` -> Target select **Internet Gateway** -> Select ```ticket-app-igw```.
     * Click **Save changes**.
   * Select the **Subnet associations** tab -> click **Edit subnet associations**:
     * Check **ticket-app-subnet-public-a** and **ticket-app-subnet-public-b** -> click **Save associations**.

![Public Route Table](/images/5-Workshop/5.3-Network-Security/public_rt.png)

2. **Private Route Table A**:
   * Click **Create route table** -> Name: ```ticket-app-private-rt-a``` -> Select VPC -> click **Create**.
   * **Routes** tab -> click **Edit routes** -> Add route: Destination ```0.0.0.0/0``` -> Target select **NAT Gateway** -> Select ```ticket-app-nat-gateway-a``` -> Save.
   * **Subnet associations** tab -> Edit -> Select **ticket-app-subnet-private-a** -> Save.

3. **Private Route Table B**:
   * Do the same, create route table ```ticket-app-private-rt-b``` -> route ```0.0.0.0/0``` to **NAT Gateway B** -> Associate with **ticket-app-subnet-private-b**.
