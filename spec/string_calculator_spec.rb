# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'When the string is empty' do
      it 'Should returns 0' do
        calculator = StringCalculator.new('')
        expect(calculator.add).to eq(0)
      end
    end

    context 'When the string contains digits' do
      it 'Should returns the sum of the numbers' do
        calculator = StringCalculator.new('1,2,3')
        expect(calculator.add).to eq(6)
      end
    end

    context 'When the string contains new lines between numbers' do
      it 'Should returns the sum of the numbers' do
        calculator = StringCalculator.new("1\n2,3")
        expect(calculator.add).to eq(6)
      end

      it 'Should returns the sum of the numbers' do
        calculator = StringCalculator.new("1\n2,\n3\n")
        expect(calculator.add).to eq(6)
      end
    end

    context 'When the string contains a different delimiter' do
      it 'Should returns the sum of the numbers' do
        calculator = StringCalculator.new("//;\n1;2")
        expect(calculator.add).to eq(3)
      end
    end

    context 'When the string contains negative numbers' do
      it 'Should raises an exception' do
        calculator = StringCalculator.new('1,2,3,-4')
        expect do
          calculator.add
        end.to raise_error(StringCalculator::NegativeNumberError, 'Negative numbers are not allowed: -4')
      end
    end

    context 'When the string contains invalid input' do
      it 'Should raises an exception' do
        calculator = StringCalculator.new("1,\n")
        expect { calculator.add }.to raise_error(StringCalculator::InvalidInputError, 'Invalid input error')
      end

      it 'Should raises an exception' do
        calculator = StringCalculator.new('1,,2,3')
        expect { calculator.add }.to raise_error(StringCalculator::InvalidInputError, 'Invalid input error')
      end

      it 'Should raises an exception' do
        calculator = StringCalculator.new('1,2,3,')
        expect { calculator.add }.to raise_error(StringCalculator::InvalidInputError, 'Invalid input error')
      end
    end
  end
end
