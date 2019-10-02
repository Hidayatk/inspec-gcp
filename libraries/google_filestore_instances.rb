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
class Instances < GcpResourceBase
  name 'google_filestore_instances'
  desc 'Instance plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:create_times, field: :create_time)
  filter_table_config.add(:tiers, field: :tier)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:file_shares, field: :file_shares)
  filter_table_config.add(:networks, field: :networks)
  filter_table_config.add(:etags, field: :etag)
  filter_table_config.add(:zones, field: :zone)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('instances')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'name' => ->(obj) { return :name, obj['name'] },
      'description' => ->(obj) { return :description, obj['description'] },
      'createTime' => ->(obj) { return :create_time, parse_time_string(obj['createTime']) },
      'tier' => ->(obj) { return :tier, obj['tier'] },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'fileShares' => ->(obj) { return :file_shares, GoogleInSpec::Filestore::Property::InstanceFileSharesArray.parse(obj['fileShares'], to_s) },
      'networks' => ->(obj) { return :networks, GoogleInSpec::Filestore::Property::InstanceNetworksArray.parse(obj['networks'], to_s) },
      'etag' => ->(obj) { return :etag, obj['etag'] },
      'zone' => ->(obj) { return :zone, obj['zone'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://file.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{zone}}/instances'
  end
end
