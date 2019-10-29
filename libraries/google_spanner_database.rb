# frozen_string_literal: false

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
require 'gcp_backend'

# A provider to manage Cloud Spanner resources.
class SpannerDatabase < GcpResourceBase
  name 'google_spanner_database'
  desc 'Database'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :instance

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @instance = @fetched['instance']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Database #{@params[:name]}"
  end

  private

  def product_url
    'https://spanner.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/instances/{{instance}}/databases/{{name}}'
  end
end
