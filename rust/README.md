# Rust

## What's in the box?
* The latest stable version of [Rust and Cargo](https://www.rust-lang.org)
* The Rust source code
* [Racer](https://github.com/phildawes/racer)
* vim
  * [vim-racer](https://github.com/racer-rust/vim-racer)
  * [rust.vim](https://github.com/rust-lang/rust.vim)
  * [syntastic](https://github.com/scrooloose/syntastic)

## How do I use it?
Create the rust image by running the following command from the ``/rust`` directory:
```bash
docker build -t rust .
```

The Rust environment can then be launched with:
```bash
cd <your-project-directory>
docker run --rm --name rust -it -v $(pwd):/code rust
```

This will place you in a bash shell on the Rust Docker container. Your code will be mounted to ``/code`` in the container. From here you can edit your files with ``vim``, or build your project with ``cargo``.
