package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestEksCluster(t *testing.T) {
  t.Parallel()

  opts := &terraform.Options{
    TerraformDir: "../environments/dev",
  }

  defer terraform.Destroy(t, opts)
  terraform.InitAndApply(t, opts)

  clusterName := terraform.Output(t, opts, "cluster_name")
  assert.Equal(t, "dev-eks-cluster", clusterName)
}

