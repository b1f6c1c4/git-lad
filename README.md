# `git-lad`

> Make git follow symlinks again, but easier

## Compare with [GitBSLR](https://github.com/Alcaro/GitBSLR)

Pros:

- This repo only provides an symlink-agnostic alternative for `git add`.
  The behavior of Git itself is totally predictable, compared to that of GitBSLR.
- This is just a several link bash script compared to that of a thousand-line C++ program.
- You don't need `LD_PRELOAD` or anything magic.
- This one **fully supports submodules**.

Cons:

- `git status` doesn't work. Any changes towards symlink itself nor the linked file(s)
    will NOT be visible in `git status`.
- `git update-index --skip-worktree` is called. **You** are responsible for
    making sure that everything is up-to-date.
- `git rebase` and `git merge` may work or not work.
- You must specify individual files/submodules to add, instead of a folder.
- No built-in glob support. Use your shell's glob.
- No `.gitignore` support.

## Usage

- Case 1: Symlink to a file (or submodule)

    1. Suppose you are inside a repo in which `file` is a symlink to a regular file `/opt/file`.

        ```sh
        # git init
        touch /opt/file
        ln -sfT /opt/file file
        ```

    1. To properly add the file `/opt/file`:

        ```sh
        git lad file
        ```

- Case 2: Symlink to a folder

    1. Suppose you are inside a repo in which `data` is a symlink to folder `/opt/data`.

        ```sh
        # git init
        mkdir -p /opt/data
        ln -sfT /opt/file data
        ```

    1. To properly add a file `/opt/data/f`: (submodules inside `/opt/data` follow the same syntax)

        ```sh
        # touch /opt/data/f
        git lad file/f
        ```

    1. Note that `git lad file` is forbidden. You have to specify individual files.

## Installation

Install [`git-get`](https://github.com/b1f6c1c4/git-get) first and then:

```sh
git get b1f6c1c4/git-lad -o ~/.local/bin/ -- git-lad
export PATH="$HOME/.local/bin:$PATH"
```

## License

MIT

