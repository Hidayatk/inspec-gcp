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
require 'google/compute/property/urlmap_path_matchers_path_rules'
module GoogleInSpec
  module Compute
    module Property
      class UrlMapPathMatchers
        attr_reader :default_service

        attr_reader :description

        attr_reader :name

        attr_reader :path_rules

        def initialize(args = nil)
          return if args.nil?
          @default_service = args['defaultService']
          @description = args['description']
          @name = args['name']
          @path_rules = GoogleInSpec::Compute::Property::UrlMapPathMatchersPathRulesArray.parse(args['pathRules'])
        end
      end

      class UrlMapPathMatchersArray
        def self.parse(value)
          return if value.nil?
          return UrlMapPathMatchers.new(value) unless value.is_a?(::Array)
          value.map { |v| UrlMapPathMatchers.new(v) }
        end
      end
    end
  end
end
