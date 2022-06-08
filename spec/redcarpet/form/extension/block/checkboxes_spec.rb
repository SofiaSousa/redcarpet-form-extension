# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Block::Checkboxes do
  context 'when .html' do
    it 'returns a fieldset with a checkbox' do
      text = [['', '', '']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><input type="checkbox" name="123456[]" value="opt_1" /></fieldset>')
    end

    it 'returns a fieldset with a checked checkbox' do
      text = [['x', '', '']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><input type="checkbox" name="123456[]" value="opt_1" checked /></fieldset>')
    end

    it 'returns a fieldset with multiple checkboxes with labels' do
      text = [['', '{value="option_1"}', 'Option 1'], ['x', '', 'Option 2 "with quotes"'], ['x', '{}', 'Option 3']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><label><input type="checkbox" name="123456[]" value="option_1" />Option 1</label><label><input type="checkbox" name="123456[]" value="opt_2" checked />Option 2 "with quotes"</label><label><input type="checkbox" name="123456[]" value="opt_3" checked />Option 3</label></fieldset>')
    end
  end
end
