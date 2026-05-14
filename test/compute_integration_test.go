package test

import (
    "testing"

    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)

func TestComputeInfrastructure(t *testing.T) {

    terraformOptions := &terraform.Options{
        TerraformDir: "../env/dev",
    }

    defer terraform.Destroy(t, terraformOptions)

    terraform.InitAndApply(t, terraformOptions)

    publicIP := terraform.Output(t, terraformOptions, "ec2_public_ip")

    assert.NotEmpty(t, publicIP)
}