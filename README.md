# Diff Check

[![ci](https://github.com/terenceponce/diff_check/actions/workflows/ci.yml/badge.svg)](https://github.com/terenceponce/diff_check/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/terenceponce/diff_check/graph/badge.svg?token=F692aysHWW)](https://codecov.io/gh/terenceponce/diff_check)


## Overview

Diff Check is a command-line tool that compares two files and prints the
differences between them.

The way this works is that it builds a 2D matrix of the two files by
computing for the longest subsequence between each files. It then prints
the differences between the two files by backtracking through the matrix.

The LCS implementation used is based on this Wikipedia article:

https://en.wikipedia.org/wiki/Longest_common_subsequence

## Getting Started

There are 2 ways to use this application.

- Build the app from source
- Download the executable and run it

I recommend just building the app from source because downloading the
executable requires you to have Erlang installed anyway.

### Build from Source

First, clone the repo and go to the new directory.

```
git clone git@github.com:terenceponce/diff_check.git
cd diff_check
```

Next, make sure that you have the correct version Erlang and Elixir installed
using [asdf](https://asdf-vm.com/).

**NOTE**: If you are using a different version manager for Erlang and Elixir,
feel free to ignore this step.

```
asdf install
```

Next, install the dependencies needed by this repo and compile the executable.

```
mix deps.get
mix escript.build
```

Finally, run the executable.

```
./diff_check path/to/base/file path/to/comparison/file
```

If you don't have any files to compare, you can just use the fixtures used in
the tests.

```
./diff_check test/support/fixtures/test_response_1.json test/support/fixtures/test_response_2.json
```

### Download and Run Executable

**NOTE**: As I mentioned above, this step requires your machine to have Erlang
installed which is why I recommend just building it from source if you're
already at that point.

First, go to the [Releases Page] and download the file that looks like this.

```
diff_check-x.x.x
```

Finally, run the executable.

```
./diff_check-x-x-x path/to/base/file path/to/comparison/file
```

If you don't have any files to compare, you can just use the fixtures used in
the tests.

```
./diff_check-x-x-x test/support/fixtures/test_response_1.json test/support/fixtures/test_response_2.json
```

[Releases Page]: https://github.com/terenceponce/diff_check/releases
