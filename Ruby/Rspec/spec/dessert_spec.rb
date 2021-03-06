require 'rspec'
require 'dessert'

# Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.

describe Dessert do
  let(:chef) { double('chef', name: 'Wawan') }
  let(:brownie) { Dessert.new('brownie', 100, chef) }

  describe '#initialize' do
    it 'sets a type' do
      expect(brownie.type).to eq('brownie')
    end

    it 'sets a quantity' do
      expect(brownie.quantity).to eq(100)
    end

    it 'starts ingredients as an empty array' do
      expect(brownie.ingredients).to be_empty
    end

    it 'raises an argument error when given a non-integer quantity' do
      expect { Dessert.new('some_cake', '100', chef) }.to raise_error(ArgumentError)
    end
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      brownie.add_ingredient('chocolate')
      expect(brownie.ingredients).to include('chocolate')
    end
  end

  describe '#mix!' do
    it 'shuffles the ingredient array' do
      ingredients = %w[chocolate flour egg sugar butter]

      ingredients.each do |ing|
        brownie.add_ingredient(ing)
      end

      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).not_to eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity' do
      brownie.eat(20)
      expect(brownie.quantity).to eq(80)
    end

    it 'raises an error if the amount is greater than the quantity' do
      expect { brownie.eat(120) }.to raise_error('not enough left!')
    end
  end

  describe '#serve' do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Wawan the Great Baker')
      expect(brownie.serve).to eq('Chef Wawan the Great Baker has made 100 brownies!')
    end
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
