# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------

title 'Test GCP google_project_metric resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
logging_metric = attribute('logging_metric', default: {
  "name": "some/metric",
  "filter": "resource.type=gae_app AND severity>=ERROR",
  "metric_kind": "DELTA",
  "value_type": "INT64"
}, description: 'Logging metric definition')
control 'google_project_metric-1.0' do
  impact 1.0
  title 'google_project_metric resource test'

  describe google_project_metric(project: gcp_project_id, name: logging_metric['name']) do
    it { should exist }
    its('filter') { should cmp logging_metric['filter'] }
    its('metric_descriptor.metric_kind') { should cmp logging_metric['metric_kind'] }
    its('metric_descriptor.value_type') { should cmp logging_metric['value_type'] }
  end

  describe google_project_metric(project: gcp_project_id, name: 'nonexistent') do
    it { should_not exist }
  end
end