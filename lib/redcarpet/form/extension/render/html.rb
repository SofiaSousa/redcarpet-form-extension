# frozen_string_literal: true

require_relative '../block/checkboxes'
require_relative '../block/radio_buttons'
require_relative '../block/textarea'

require_relative '../inline/input'

module Redcarpet
  module Form
    module Extension
      module Render
        # Custom HTML render
        class HTML < Redcarpet::Render::HTML
          def paragraph(text)
            # process_custom_tags("<p>#{text.strip}</p>\n")
            process_custom_tags(text.strip)
          end

          private

          # Processes custom tags (inline tags and block tags)
          def process_custom_tags(text)
            text = CGI.unescape_html(text)

            # Inline tags
            inline_tags.each do |klass|
              text.gsub!(klass.pattern) { |sub| klass.html(sub) }
            end

            # Block tags (replace line)
            block_tags.each do |klass|
              next unless text.match?(klass.pattern)

              return klass.html(text.scan(klass.pattern))
            end

            text
          end

          # List of inline tags
          def inline_tags
            [
              Redcarpet::Form::Extension::Inline::Input
            ]
          end

          # List of block tags
          def block_tags
            [
              Redcarpet::Form::Extension::Block::Checkboxes,
              Redcarpet::Form::Extension::Block::RadioButtons,
              Redcarpet::Form::Extension::Block::Textarea
            ]
          end
        end
      end
    end
  end
end
