require_relative './like'

describe Wli do
    it 'no one likes' do
        wli = Wli.new([])
        likes = wli.isLike
        expect(likes).to eq('no one likes this')
    end

    it 'one people likes' do
        wli = Wli.new(["Peter"])
        likes = wli.isLike
        expect(likes).to eq('Peter likes this')
    end

    it 'two people likes' do
        wli = Wli.new(["Jacob","Alex"])
        likes = wli.isLike
        expect(likes).to eq('Jacob and Alex like this')
    end

    it 'three people likes' do
        wli = Wli.new(["Jacob","Alex", "Mark"])
        likes = wli.isLike
        expect(likes).to eq('Jacob, Alex, and Mark like this')
    end

    it 'four people and more likes' do
        wli = Wli.new(["Jacob","Alex", "Mark", "Max"])
        likes = wli.isLike
        expect(likes).to eq('Jacob, Alex, and 2 others like this')
    end
end