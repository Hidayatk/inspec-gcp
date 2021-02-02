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
module GoogleInSpec
  module Compute
    module Property
      class RegionBackendServiceCdnPolicyCacheKeyPolicy
        attr_reader :include_host

        attr_reader :include_protocol

        attr_reader :include_query_string

        attr_reader :query_string_blacklist

        attr_reader :query_string_whitelist

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @include_host = args['includeHost']
          @include_protocol = args['includeProtocol']
          @include_query_string = args['includeQueryString']
          @query_string_blacklist = args['queryStringBlacklist']
          @query_string_whitelist = args['queryStringWhitelist']
        end

        def to_s
          "#{@parent_identifier} RegionBackendServiceCdnPolicyCacheKeyPolicy"
        end
      end
    end
  end
end
