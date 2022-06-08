# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Inline::Input do
  it 'returns an input text with default attributtes' do
    text = '___'
    expect(described_class.html(text)).to eq('<input type="text" name="" />')
  end

  it 'returns an input text with custom attributes' do
    text = '___{ name="hello" value="default value" class="my-class" data-attr="1" }'
    expect(described_class.html(text)).to eq('<input type="text" name="hello" value="default value" class="my-class" data-attr="1" />')
  end

  it 'returns a checkbox with default attributes' do
    text = '___{type="checkbox"}'
    expect(described_class.html(text)).to eq('<input type="checkbox" name="" />')
  end

  it 'returns a checkbox with custom attributes' do
    text = '___{type="checkbox" name="option 1" value="1" }'
    expect(described_class.html(text)).to eq('<input type="checkbox" name="option 1" value="1" />')
  end
end
