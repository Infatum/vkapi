# Vkapi

VkAPI wrapper in pure Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add vkapi to your list of dependencies in `mix.exs`:

        def deps do
          [{:vkapi, "~> 0.0.1"}]
        end

  2. Ensure vkapi is started before your application:

        def application do
          [applications: [:vkapi]]
        end

## Contribute

If you want to write some code:

  1. Fork this repository.

  2. Create new branch, move to it.

  3. Perform your code modifications, commit it to your branch.

  4. Make a new pull request to main repository, don't forget to write explantion of your modifications.

You are free to open issues on issue tracker in all cases, except asking question. Use https://telegram.me/proelixir

## Running tests

Clone the repo and fetch its dependencies:

```bash
$ git clone https://github.com/virviil/vkapi.git
$ cd vkapi
$ mix deps.get
$ mix test
```

## Building docs

```bash
$ MIX_ENV=docs mix docs
```