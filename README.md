# Bookstore API

## Adding a new resource

1. Generate the model and the migration

    ```shell
    rails g model Book title author no_pages:integer discarded_at:datetime:index
    ```

    - Fix rubocop issues
    
2. Generate the controller with all the CRUD actions

    ```shell
    rails g scaffold_controller Api::V1::Book title author no_pages discarded_at --no-test-framework
    ```

    - Fix references to the mdoel in the controller
    - Fix references to the model in the views
    - Fix rubocop issues

    - Change destroy to use `discard` in place of `destroy`
    
3. Create an integration test for Rswag

    - use `spec/requests/api/v1/books_controller_spec.rb` as a template
