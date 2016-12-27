# Chemistry

A testing framework for Elixir.

## Installation

[available in Hex](https://hex.pm/packages/chemistry), the package can be installed as:

  1. Add `chemistry` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:chemistry, "~> 0.1.4"}]
    end
    ```

  2. Ensure `chemistry` is started before your application:

    ```elixir
    def application do
      [applications: [:chemistry]]
    end
    ```

## Examples

From Interactive Elixir, type `iex` from terminal.

```elixir
iex(1)> import Chemistry.Lab 
Chemistry.Lab
iex(2)> expect 1 == 1
.:ok
iex(3)> expect 1 > 1
FAILURE:
  Expected: 1 to be greater than 1

:ok
iex(4)> 
```

Place all labs inside of `./lab` and be sure to append `_lab.exs` to
anything you want to be a lab.

Write expressive tests using a call to `it` followed by a description
for the lab.

```elixir
defmodule MathLab do
  use Chemistry.Lab

  it "Can use integers for addition and subtraction." do
    expect 2 + 3 == 5
    expect 5 - 5 == 10
  end

  it "Can use integers for multiplication and division" do
    expect 5 * 5 == 25
    expect 10 / 2 == 5
  end
end
```

Run `iex` from the terminal to see an example file message.

```
iex(1)> MathLab.run
.===========================================
FAILURE: Can use integers for addition and subtraction.
===========================================
FAILURE:
  Expected: 0 to be equal to 10


:ok
```

## License
Copyright 2016 Yianna Kokalas

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at [Apache
2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

