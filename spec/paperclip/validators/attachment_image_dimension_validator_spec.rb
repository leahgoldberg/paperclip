require 'spec_helper'

describe Paperclip::Validators::AttachmentImageDimensionValidator do
  before do
    rebuild_model
    @dummy = Dummy.new
  end

  def build_validator(options = {})
    @validator = Paperclip::Validators::AttachmentImageDimensionValidator.new(options.merge(attributes: :avatar))
  end

  context 'with a failing validation' do
    it 'adds an error to the base object' do

    end
  end

  context 'with a passing validation' do
    it 'does not an add an error to the base object' do

    end
  end

  context 'using the helper' do
    it 'adds the validator to the class' do

    end
  end

  context 'given options' do
    it 'raises an argument error if no option was passed' do

    end

    it 'does not raise an error if both :width and :height are provided' do
      
    end
  end
end
