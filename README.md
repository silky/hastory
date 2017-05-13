# Hastory

Optimise the way you use your terminal using your own history.

## Installing the `hastory` binary from source

First get the hastory sources:

``` shell
git clone https://github.com/NorfairKing/hastory
```

You can install hastory with [`stack`](https://haskellstack.org/)

``` shell
cd hastory
stack install
```

## Installing the Hastory harness

To start recording your history with `hastory`, we need to hook into your shell's functionality to record every command you execute.

With `hastory generate-gather-wrapper-script`, we can generate this script automatically.
This means that the only thing you need to do is to put the following in a script that is loaded on your shell's startup script. (This works with `bash` and `zsh`.)

``` shell
PROMPT_COMMAND+=$(hastory generate-gather-wrapper-script)
```

When you restart your shell (for example by restarting your terminal), you should see history accumulating in `.hastory/commandhistory.log`.

Note: Feel free to make sure that `hastory generate-gather-wrapper-script` is actually code that you actually want to run.

## Frequency-based directory changes

> The ease of performing a task should be proportional to its frequency.

Using your command history, `hastory` can predict the N directories that you are most likely to want to jump to.

To use this feature, you need to hook into your shell again.
With `hastory generate-change-directory-wrapper-script`, we can generate this script automatically.

To source this script every time, put the following in your shell's startup script. (`.bashrc` for bash, `.zshrc` for zsh, for example.)

``` shell
source <(hastory generate-change-directory-wrapper-script)
```

Now you can run `hastory_change_directory_` to list the directories that you might want to jump to.
The output should look something like this:

``` shell
/home/user $ hastory_change_directory_
0  /home/user/work/
1  /home/user/a/very/deep/directory/tree/that/i/use/often
2  /home/user/archive
3  /home/user/backup
```

If the directory that you want to jump to is in the list with index `i`, you can jump to it with `hastory_change_directory_ i`.

``` shell
/home/user $ `hastory_change_directory_ 1
/home/user/a/very/deep/directory/tree/that/i/use/often $ 
```

Now you probably want to alias that long command `hastory_change_directory_` to something shorter like `f`, as follows:

``` shell
alias f=hastory_change_directory_
```

Note: Feel free to make sure that `hastory generate-change-directory-wrapper-script` is code that you actually want to run.
