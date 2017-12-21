require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do

  describe '#page_title' do
    context 'when input empty' do
      it 'expect return "IMT"' do
        expect(helper.page_title('')).to eq('IMT')
      end
    end

    context 'when input "Edit Event"' do
      it 'expect return "IMT | Edit Event"' do
        expect(helper.page_title('Edit Event')).to eq('IMT | Edit Event')
      end
    end
  end

  describe '#js_tag' do
    context 'when input empty' do
      it 'expect return script tags' do
        expect(helper.js_tag('')).to eq('<script></script>')
      end
    end

    context 'when input not empty' do
      it 'expect return script tags' do
        expect(helper.js_tag('test-script')).to eq('<script>test-script</script>')
      end
    end
  end

end
