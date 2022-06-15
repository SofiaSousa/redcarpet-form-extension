# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Block::RadioButtons do
  context 'when .html' do
    it 'returns a block with a radio button' do
      text = [['', '', '']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><input type="radio" name="123456" value="radio_1" /></fieldset>')
    end

    it 'returns a block with a checked radio button' do
      text = [['x', '', '']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><input type="radio" name="123456" value="radio_1" checked /></fieldset>')
    end

    it 'returns a block with multiple radio button with labels' do
      text = [['', '{value="option_1"}', 'Option 1'], ['x', '', 'Option 2'], ['x', '{}', 'Option 3']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><label><input type="radio" name="123456" value="option_1" /><span>Option 1</span></label><label><input type="radio" name="123456" value="radio_2" checked /><span>Option 2</span></label><label><input type="radio" name="123456" value="radio_3" checked /><span>Option 3</span></label></fieldset>')
    end
  end
end
