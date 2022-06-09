# frozen_string_literal: true

module Redcarpet
  module Form
    module Extension
      module Block
        # rubocop:disable Layout/LineLength
        # A fieldset with checkboxes
        #
        # Ex: []{value="bike"} I have a bike [x]{value="car"} I have a car [x]{value="boat"} I have a boat
        # <fieldset>
        #   <label><input type="checkbox" name="123456[]" value="bike" />I have a bike</label>
        #   <label><input type="checkbox" name="123456[]" value="car" checked />I have a car</label>
        #   <label><input type="checkbox" name="123456[]" value="boat" checked />I have a boat</label>
        # </fieldset>
        # rubocop:enable Layout/LineLength
        class Checkboxes
          def self.pattern
            /\[(x|\s)?\]([{][^}]*[}])?([^{}\]\[]*)/
          end

          def self.default_attributes
            { 'type' => 'checkbox', 'name' => '', 'value' => '' }
          end

          # rubocop:disable Metrics/MethodLength
          # rubocop:disable Metrics/AbcSize
          def self.html(matches)
            html = '<fieldset>'
            name = "#{Util.random_string}[]"

            matches.each_with_index do |item, index|
              checked = item[0]
              label = item[2]

              attrs = default_attributes.merge!(Util.parse_attributes(item[1]))
              attrs['name'] = name if attrs['name'].empty?
              attrs['value'] = "opt_#{index + 1}" if attrs['value'].empty?

              html += '<label>' unless label.empty?
              html += "<input #{Util.attributes_to_s(attrs)}"
              html += ' checked' if checked == 'x'
              html += ' />'
              html += "#{label}</label>" unless label.empty?
            end

            html += '</fieldset>'
          end
          # rubocop:enable Metrics/AbcSize
          # rubocop:enable Metrics/MethodLength
        end
      end
    end
  end
end
