# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Util do
  it 'returns an hash given a string' do
    text = '{value="bike"}'
    expect(described_class.parse_attributes(text)).to eq({ 'value' => 'bike' })
  end
end
