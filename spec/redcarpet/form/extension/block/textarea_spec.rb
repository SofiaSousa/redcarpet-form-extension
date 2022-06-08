# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Block::Textarea do
  context 'when .html' do
    it 'returns a fieldset with an emty textarea' do
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      text = [['{}', '']]
      expect(described_class.html(text)).to eq('<fieldset><textarea name="123456" rows="3"></textarea></fieldset>')

      text = [['', '']]
      expect(described_class.html(text)).to eq('<fieldset><textarea name="123456" rows="3"></textarea></fieldset>')
    end

    it 'returns a fieldset with a label and a textarea' do
      text = [['', 'Text box']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><label>Text box</label><textarea name="123456" rows="3"></textarea></fieldset>')
    end

    it 'returns a fieldset with multiple checkboxes with labels' do
      text = [['{value="Some text here" cols="5" rows="10"}', 'Text box 1'], ['', 'Text box 2']]
      allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('123456')

      expect(described_class.html(text)).to eq('<fieldset><label>Text box 1</label><textarea name="123456" rows="10" cols="5">Some text here</textarea><label>Text box 2</label><textarea name="123456" rows="3"></textarea></fieldset>')
    end
  end
end
