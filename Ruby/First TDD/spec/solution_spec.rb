require 'rspec'
require 'solution'

describe Array do
  let(:arr) { [1, 3, 4, 1, 3, 7] }
  let(:uniqued_array) { arr.dup.my_uniq }

  describe '#my_uniq' do
    it 'removes duplicates' do
      arr.each do |item|
        expect(uniqued_array.count(item)).to eq(1)
      end
    end

    it 'only contains items from original array' do
      uniqued_array.each do |item|
        expect(arr).to include(item)
      end
    end

    it 'does not modify original array' do
      expect do
        arr.my_uniq
      end.to_not change { arr }
    end
  end

  describe '#two_sum' do
    let(:array) { [-5, -3, 1, 3] }
    let(:examp) { [-1, 0, 2, -2, 1] }
    it 'should return n list item that sum return 0' do
      expect(array.two_sum).to eq([[1, 3]])
      expect(examp.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    let(:rows) do
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
    end

    it 'should transpose the array' do
      expect(rows.my_transpose).to eq([[0, 3, 6],
                                       [1, 4, 7],
                                       [2, 5, 8]])
    end
  end
end
