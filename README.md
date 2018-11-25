# Bookstore API

## Adding a new resource

1. Generate the model and the migration

    ```shell
    rails g model Book title author no_pages:integer discarded_at:datetime:index
    ```

    **Fix rubocop issues**
