require_relative './test_helper'
require_relative './incremental_array'

describe IncrementArray do
    context '#increment' do
        it 'should be return [1] when input [0]' do
            input = [0]
            expected_output = [1]

            actual_output = IncrementArray.new.increment(input)
            expect(actual_output).to eq(expected_output)
        end

        it 'should be return [2] when input [1]' do
            input = [1]
            expected_output = [2]

            actual_output = IncrementArray.new.increment(input)
            expect(actual_output).to eq(expected_output)
        end

        it 'should be return [1, 0] when input [9]' do
            input = [9]
            expected_output = [1, 0]

            actual_output = IncrementArray.new.increment(input)
            expect(actual_output).to eq(expected_output)
        end
    end
end