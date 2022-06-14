# frozen_string_literal: true

module Redcarpet
  module Form
    module Extension
      module Inline
        # A single input tag
        #
        # Ex: [input]{ type="number" }
        # <input type="number" name="" />
        class Input
          def self.pattern
            /\[input\]([{][^}]*[}])?/
          end

          def self.default_attributes
            { 'type' => 'text', 'name' => Util.random_string }
          end

          def self.html(text)
            attrs = default_attributes.merge!(Util.parse_attributes(text))
            "<input #{Util.attributes_to_s(attrs)} />"
          end
        end
      end
    end
  end
end
