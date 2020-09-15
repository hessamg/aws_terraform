provider "aws"{
    region = "eu-central-1"
}

resource "aws_iam_user" "myUser"{
    name = "John"
}

region "aws_aim_policy" "customPolicy"{
    name = "GlacierEC2EFS"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteManagedPrefixList",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "ec2:DeleteVpcEndpoints",
                "ec2:ResetInstanceAttribute",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:AttachInternetGateway",
                "ec2:ReportInstanceStatus",
                "ec2:DeleteVpnGateway",
                "ec2:CreateRoute",
                "elasticfilesystem:ClientMount",
                "ec2:UnassignPrivateIpAddresses",
                "glacier:PurchaseProvisionedCapacity",
                "ec2:CancelExportTask",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:AssociateClientVpnTargetNetwork",
                "ec2:StopInstances",
                "ec2:CreateVolume",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:CreateNetworkInterface",
                "ec2:CancelSpotInstanceRequests",
                "ec2:CreateTransitGatewayRoute",
                "ec2:CreateTransitGatewayVpcAttachment",
                "glacier:SetVaultNotifications",
                "ec2:DeleteDhcpOptions",
                "glacier:CompleteMultipartUpload",
                "ec2:DeleteNatGateway",
                "ec2:CancelCapacityReservation",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "glacier:ListVaults",
                "ec2:ModifyVpcEndpoint",
                "ec2:ModifyInstanceCapacityReservationAttributes",
                "ec2:CreateVpnConnection",
                "ec2:DeleteSpotDatafeedSubscription",
                "ec2:ImportVolume",
                "ec2:DeleteTransitGatewayPrefixListReference",
                "ec2:MoveAddressToVpc",
                "ec2:ModifyFleet",
                "ec2:RunScheduledInstances",
                "ec2:ModifyIdentityIdFormat",
                "ec2:CreateVpc",
                "ec2:RequestSpotFleet",
                "ec2:WithdrawByoipCidr",
                "ec2:ReleaseHosts",
                "ec2:DeleteTransitGatewayMulticastDomain",
                "ec2:ModifySubnetAttribute",
                "ec2:CreateSnapshot",
                "ec2:DeleteLaunchTemplateVersions",
                "ec2:DeleteNetworkAcl",
                "ec2:ModifyReservedInstances",
                "ec2:ReleaseAddress",
                "ec2:ModifyInstanceMetadataOptions",
                "ec2:ResetFpgaImageAttribute"
            ],
            "Resource": "*"
        }
    ]
}
    EOF
}

resource "aws_aim_policy_attachment" "policyBind"{
    name = "attachment"
    users = [aws_iam_user.myUser.name]
    policy_arn = aws_aim_policy.customPolicy.arn
}