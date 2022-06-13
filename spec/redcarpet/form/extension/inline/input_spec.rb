# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Inline::Input do
  it 'returns an input text with default attributtes' do
    text = '___'
    allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('qwerty')

    expect(described_class.html(text)).to eq('<input type="text" name="qwerty" />')
  end

  it 'returns an input text with custom attributes' do
    text = '___{ name="hello" value="default value" class="my-class" data-attr="1" }'
    allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('qwerty')

    expect(described_class.html(text)).to eq('<input type="text" name="hello" value="default value" class="my-class" data-attr="1" />')
  end

  it 'returns a checkbox with default attributes' do
    text = '___{type="checkbox"}'
    allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('asdfg')

    expect(described_class.html(text)).to eq('<input type="checkbox" name="asdfg" />')
  end

  it 'returns a checkbox with custom attributes' do
    text = '___{type="checkbox" name="option 1" value="1" }'
    allow(Redcarpet::Form::Extension::Util).to receive(:random_string).and_return('asdfg')

    expect(described_class.html(text)).to eq('<input type="checkbox" name="option 1" value="1" />')
  end
end
