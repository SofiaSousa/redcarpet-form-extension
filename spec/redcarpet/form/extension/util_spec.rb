# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Util do
  it 'returns an hash given a stting' do
    text = '{value="bike"}'
    expect(described_class.parse_attributes(text)).to eq({ 'value' => 'bike' })

    text = '{value="bike" name="With quotes duh"}'
    expect(described_class.parse_attributes(text)).to eq({ 'value' => 'bike', 'name' => 'With quotes duh' })
  end
end
