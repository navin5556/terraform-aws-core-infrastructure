```markdown
# AWS and Terraform Notes

## Questions and Answers

1. **Can we delete the default VPC?**  
   Yes, you can delete it, but it's not recommended.

2. **Can we create a default VPC?**  
   You cannot manually create a default VPC, but you can request AWS support to recreate it.

3. **Can we create a default VPC using Terraform?**  
   No, you cannot create a "default VPC" using Terraform, because Terraform does not have built-in support for creating default VPCs.
   However, you can create a VPC that mimics the default VPC's configuration using Terraform.

4. **What is the difference between `aws_default_vpc` and `aws_vpc` resources?**  

   - **aws_default_vpc**
     - **Purpose**: Used to manage the default VPC that AWS automatically creates in each region for new accounts.
     - **Creation**: You cannot create a new default VPC using this resource; it can only be used to manage the existing default VPC.
     - **Use Case**: Useful if you want to manage the tags or other attributes of the default VPC that AWS has already created for you.
     - **Import**: Often used to import the existing default VPC into Terraform state.

   - **aws_vpc**
     - **Purpose**: Used to create and manage custom VPCs in your AWS account.
     - **Creation**: You can create as many VPCs as you need using this resource.

5. **What is the use of `mumbai-default.tf` file?**  
   This Terraform configuration is used to manage and tag the default VPC and its associated resources in the Mumbai region, ensuring they
   are properly tagged and configured according to your organization's standards. This code adds the tag and removes internet-gateway routes
   from the default route-table for the default VPC. In summary, removing this route would cause all traffic from your VPC to the internet
   and from the internet to your VPC to fail, unless there’s another route that enables internet access.

6. **Are the CIDR of the default VPC and the default subnet for every user the same?**  
   Yes, I have cross-checked with my personal account and my project account.

7. **Error: Variables not allowed**  
   This error occurs when you try to use a variable in a place where it is not allowed. In this case, the error is on `backend.tf` line 21,
   in the `terraform` block: `region = var.region`. Variables may not be used here.
```
