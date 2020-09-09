require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author) do
    Author.create({
                    name: 'George Raymond Richard Martin',
                    birth_data: Date.parse('20/09/1948'),
                    nationality: 'American'
                  })
  end

  it '9 is a wrong isbn size' do
    book = Book.new title: 'A Storm of Swords', author: author, isbn: '055357342'
    expect(book.save).to be false
  end

  it '10 is a valid isbn size' do
    book = Book.new title: 'A Game of Thrones', author: author, isbn: '0553593714'
    expect(book.save).to be true
  end

  it '11 is a wrong isbn size' do
    book = Book.new title: 'A Storm of Swords', author: author, isbn: '055357342XX'
    expect(book.save).to be false
  end

  it '12 is a wrong isbn size' do
    book = Book.new title: 'A Storm of Swords', author: author, isbn: '978055357342'
    expect(book.save).to be false
  end

  it '13 is a valiod isbn size' do
    book = Book.new title: 'A Clash of Kings', author: author, isbn: '9780553579901'
    expect(book.save).to be true
  end

  it '14 is a wrong isbn size' do
    book = Book.new title: 'A Storm of Swords', author: author, isbn: '97805535734288'
    expect(book.save).to be false
  end
end
