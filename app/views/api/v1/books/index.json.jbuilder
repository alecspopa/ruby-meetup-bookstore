# frozen_string_literal: true

json.set! :books do
  json.array! @books, partial: 'api/v1/books/book', as: :book
end
