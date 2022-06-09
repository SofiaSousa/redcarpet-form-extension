# frozen_string_literal: true

module Redcarpet
  module Form
    module Extension
      module Block
        # A fieldset with radion buttons
        #
        # Ex: (){value="html"} HTML (x){value="css"} CSS (){value="js"} JavaScript
        # <fieldset>
        #   <label><input type="radio" name="123456" value="html" />HTML</label>
        #   <label><input type="radio" name="123456" value="css" checked />CSS</label>
        #   <label><input type="radio" name="123456" value="js" />JavaScript</label>
        # </fieldset>
        class RadioButtons
          def self.pattern
            /\((x|\s)?\)([{][^}]*[}])?([^{}\)\()]*)/
          end

          def self.default_attributes
            { 'type' => 'radio', 'name' => '', 'value' => '' }
          end

          def self.html(matches)
            html = '<fieldset>'
            name = Util.random_string

            matches.each_with_index do |item, index|
              checked = item[0]
              label = item[2]

              attrs = default_attributes.merge!(Util.parse_attributes(item[1]))
              attrs['name'] = name if attrs['name'].empty?
              attrs['value'] = "radio_#{index + 1}" if attrs['value'].empty?

              html += '<label>' unless label.empty?
              html += "<input #{Util.attributes_to_s(attrs)}"
              html += ' checked' if checked == 'x'
              html += ' />'
              html += "#{label}</label>" unless label.empty?
            end

            html += '</fieldset>'
          end
        end
      end
    end
  end
end
