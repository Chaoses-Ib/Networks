# [OpenAPI](https://www.openapis.org/)
[Wikipedia](https://en.wikipedia.org/wiki/OpenAPI_Specification)

> The OpenAPI Specifications provides a formal standard for describing HTTP APIs.
>
> This allows people to understand how an API works, how a sequence of APIs work together, generate client code, create tests, apply design standards, and much, much more.

[oas3 - OpenApi: How to define cookie in response? - Stack Overflow](https://stackoverflow.com/questions/69365166/openapi-how-to-define-cookie-in-response)

## Generators
### Rust
- [utoipa: Simple, Fast, Code first and Compile time generated OpenAPI documentation for Rust](https://github.com/juhaku/utoipa)
  - ~~[Support for repr attribute by Naymoll - Pull Request #282](https://github.com/juhaku/utoipa/pull/282)~~

  > Maybe I am really missing it, but I don't actually see utoipa as the right level of automation. Really feels like I'm just writing the openapi spec in a macro instead of a yaml file.

  axum:
  - [todo-axum](https://github.com/juhaku/utoipa/blob/master/examples/todo-axum/src/main.rs)
  - [axum-utoipa-bindings](https://github.com/juhaku/utoipa/blob/master/examples/axum-utoipa-bindings/src/main.rs)

  Libraries:
  - [utoipauto: Rust Macros to automate the addition of Paths/Schemas to Utoipa crate, simulating Reflection during the compilation phase](https://github.com/ProbablyClem/utoipauto)

- [aide: An API documentation library](https://github.com/tamasfe/aide)
  - [How to show variant name of tagged enum? - Issue #98 - tamasfe/aide](https://github.com/tamasfe/aide/issues/98)

  [Aide: yet another code-first Open API generation library for Axum (and potentially others) : r/rust](https://www.reddit.com/r/rust/comments/x8gj8c/aide_yet_another_codefirst_open_api_generation/)

- axum: [Support generating OpenAPI/Swagger docs - Issue #50 - tokio-rs/axum](https://github.com/tokio-rs/axum/issues/50)

- Poem: [poem-openapi](https://crates.io/crates/poem-openapi)

Discussions:
- 2023-04 [What is the best API generator for Axum? : r/rust](https://www.reddit.com/r/rust/comments/12fuwzs/what_is_the_best_api_generator_for_axum/)
- 2023-06 [Using rust to generate typescript client : r/rust](https://www.reddit.com/r/rust/comments/13z5shv/using_rust_to_generate_typescript_client/)
- 2024-09 [Which library to use with Axum for OpenApi? : r/rust](https://www.reddit.com/r/rust/comments/1ffm29t/which_library_to_use_with_axum_for_openapi/)

## Client generators
- [Swagger Codegen](https://swagger.io/tools/swagger-codegen/)