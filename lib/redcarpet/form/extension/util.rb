# frozen_string_literal: true

module Redcarpet
  module Form
    module Extension
      # Utils
      module Util
        def self.attributes_pattern
          /(\S+)=["']([^"']*)["']/
        end

        def self.parse_attributes(text)
          return {} unless text

          attr_str = text.match(/[{]([^}]*)/)

          return {} unless attr_str
          return {} unless attr_str[1]

          attr_str[1].scan(attributes_pattern).to_h
        end

        def self.attributes_to_s(attributes)
          return '' unless attributes

          attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
        end

        def self.random_string
          (0...6).map { ('a'..'z').to_a[rand(26)] }.join
        end
      end
    end
  end
end
