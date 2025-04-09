# frozen_string_literal: true

RSpec.describe Redcarpet::Form::Extension::Render::HTML do
  let(:renderer) { described_class.new }

  it 'returns html without unsafe tags/attributes (audio src)' do
    text = '<input type="text" name="qwerty" value="<audio src/onerror=alert(1)>" /><audio src/onerror=alert(2)>'
    expect(renderer.postprocess(text)).to eq('<input type="text" name="qwerty" value="&lt;audio src/onerror=alert(1)&gt;"><audio></audio>')
  end

  it 'returns html without unsafe tags/attribuets (script)' do
    text = '<script>alert("hello")</script>'
    expect(renderer.postprocess(text)).to eq('')
  end

  it 'returns html without unsafe tags/attribuets (href attributes)' do
    text = "<a href='https://my-bank.example.com/welcome?user=<img src=x onerror=alert(2)>'>Get a free kitten!</a>"
    expect(renderer.postprocess(text)).to eq('<a href="https://my-bank.example.com/welcome?user=&lt;img%20src=x%20onerror=alert(2)&gt;">Get a free kitten!</a>')
  end
end
