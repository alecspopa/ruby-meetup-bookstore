# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::V1::BooksController, type: :request do
  before do
    @book = create(:book)
  end

  path '/books.json' do
    get '#index' do
      tags 'Books'
      consumes 'application/json'

      response '200', '#index' do
        schema type: :object,
          properties: {
            books: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  title: { type: :string },
                  author: { type: :string },
                  no_pages: { type: :integer },
                  discarded_at: { type: :string, 'x-nullable': true },
                  created_at: { type: :string },
                  updated_at: { type: :string },
                },
                required: %w[id title author no_pages discarded_at created_at updated_at],
              },
            },
          },
          required: %w[books]

        run_test!
      end
    end
  end

  path '/books/{id}.json' do
    get '#show' do
      tags 'Books'
      consumes 'application/json'

      response '200', '#show' do
        parameter name: :id, in: :path, type: :integer

        schema type: :object,
          properties: {
            book: {
              type: :object,
              properties: {
                id: { type: :integer },
                title: { type: :string },
                author: { type: :string },
                no_pages: { type: :integer },
                discarded_at: { type: :string, 'x-nullable': true },
                created_at: { type: :string },
                updated_at: { type: :string },
              },
              required: %w[id title author no_pages discarded_at created_at updated_at],
            },
          },
          required: %w[book]

        let(:id) { @book.id }

        run_test!
      end
    end
  end

  path '/books.json' do
    post '#create' do
      tags 'Books'
      consumes 'application/json'

      response '201', '#create' do
        parameter name: :payload, in: :body, schema: {
          type: :object,
          properties: {
            book: {
              type: :object,
              properties: {
                title: { type: :string },
                author: { type: :string },
                no_pages: { type: :integer },
              },
              required: %w[title author no_pages],
            },
          },
          required: %w[book],
        }

        schema type: :object,
          properties: {
            book: {
              type: :object,
              properties: {
                id: { type: :integer },
                title: { type: :string },
                author: { type: :string },
                no_pages: { type: :integer },
                discarded_at: { type: :string, 'x-nullable': true },
                created_at: { type: :string },
                updated_at: { type: :string },
              },
              required: %w[id title author no_pages discarded_at created_at updated_at],
            },
          },
          required: %w[book]

        let(:payload) do
          {
            book: {
              title: 'New Book',
              author: 'Book Author',
              no_pages: 102,
            },
          }
        end

        run_test!
      end
    end
  end

  path '/books/{id}.json' do
    put '#update' do
      tags 'Books'
      consumes 'application/json'

      response '200', '#update' do
        parameter name: :id, in: :path, type: :integer
        parameter name: :payload, in: :body, schema: {
          type: :object,
          properties: {
            book: {
              type: :object,
              properties: {
                title: { type: :string },
                author: { type: :string },
                no_pages: { type: :integer },
              },
              required: %w[title author no_pages],
            },
          },
          required: %w[book],
        }

        schema type: :object,
          properties: {
            book: {
              type: :object,
              properties: {
                id: { type: :integer },
                title: { type: :string },
                author: { type: :string },
                no_pages: { type: :integer },
                discarded_at: { type: :string, 'x-nullable': true },
                created_at: { type: :string },
                updated_at: { type: :string },
              },
              required: %w[id title author no_pages discarded_at created_at updated_at],
            },
          },
          required: %w[book]

        let(:id) { @book.id }
        let(:payload) do
          {
            book: {
              title: 'Update Book',
              author: 'Update Book Author',
              no_pages: 105,
            },
          }
        end

        run_test!
      end
    end
  end

  path '/books/{id}.json' do
    delete '#destroy' do
      tags 'Books'
      consumes 'application/json'

      response '204', '#destroy' do
        parameter name: :id, in: :path, type: :integer

        let(:id) { @book.id }

        run_test!
      end
    end
  end
end
