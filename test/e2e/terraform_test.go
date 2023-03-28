package e2e

import (
	"regexp"
	"testing"

	test_helper "github.com/Azure/terraform-module-test-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesBasic(t *testing.T) {
	test_helper.RunE2ETest(t, "../../", "examples/basic", terraform.Options{
		Upgrade: true,
	}, func(t *testing.T, output test_helper.TerraformOutput) {
		gotEchoText, ok := output["vmss_id"].(string)
		assert.True(t, ok)
		assert.Regexp(t, regexp.MustCompile("/subscriptions/<<sub_id>>/resourceGroups/anoa-eus-vmss-dev-rg/providers/Microsoft.Compute/virtualMachineScaleSets/anoa-eus-vmss-dev-vmss"), gotEchoText)
	})
}
