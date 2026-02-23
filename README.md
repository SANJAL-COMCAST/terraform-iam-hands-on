# Terraform IAM Role Hands-On

## Overview

This project demonstrates how to create an IAM Role using Terraform with:

- Trust Policy (Assume Role Policy)
- Inline Policy
- Customer Managed Policy
- Policy Attachment

The goal is to understand IAM + Terraform integration.

---

## Architecture

IAM Role
 ├── Inline Policy (ec2:DescribeInstances)
 └── Customer Managed Policy (s3:ListBucket)

---

## Prerequisites

- AWS Account
- IAM user with required permissions
- AWS CLI configured
- Terraform installed

---

## Project Structure

terraform-iam-demo/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
└── README.md

---

## Step 1 – Initialize Terraform

terraform init

Downloads AWS provider.

---

## Step 2 – Preview Changes

terraform plan

Shows resources to be created.

---

## Step 3 – Apply Configuration

terraform apply

Creates:

- IAM Role
- Inline Policy
- Managed Policy
- Policy Attachment

---

## Step 4 – Verify in AWS

Go to IAM → Roles → terraform-demo-role

Check:
- Trust relationship
- Permissions tab

---

## Step 5 – Destroy Resources

terraform destroy

Deletes all created resources.

---

## Learning Outcomes

- Understanding IAM Role
- Difference between Inline and Managed Policies
- Terraform resource referencing
- jsonencode usage
- Implicit dependency handling
