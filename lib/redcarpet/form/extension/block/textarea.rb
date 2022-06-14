# frozen_string_literal: true

module Redcarpet
  module Form
    module Extension
      module Block
        # A textarea block
        #
        # Ex: [textarea]{ value="Hello world!" rows="4" cols="10" } Text box
        # <fieldset>
        #   <label>Text box</label>
        #   <textarea name="123456" rows="4" cols="10">
        #     Hello world!
        #   </textarea>
        # </fieldset>
        class Textarea
          def self.pattern
            /\[textarea\]([{][^}]*[}])?([^{}\]\[)]*)/
          end

          def self.default_attributes
            { 'name' => Util.random_string, 'rows' => '3', 'value' => '' }
          end

          def self.html(matches)
            html = '<fieldset>'

            matches.each do |item|
              label = item[1]
              attrs = default_attributes.merge!(Util.parse_attributes(item[0]))

              html += "<label>#{label}</label>" unless label.empty?
              html += "<textarea #{Util.attributes_to_s(attrs.except('value'))}>"
              html += attrs['value'] unless attrs['value'].empty?
              html += '</textarea>'
            end

            html += '</fieldset>'
          end
        end
      end
    end
  end
end
