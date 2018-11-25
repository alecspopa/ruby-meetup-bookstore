# frozen_string_literal: true

json.set! :book do
  json.partial! 'api/v1/books/book', book: @book
end
