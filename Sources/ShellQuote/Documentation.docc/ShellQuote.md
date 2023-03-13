# ``ShellQuote``

`ShellQuote` is a micro-library to return shell-escaped input for use in POSIX shells.

## Usage

When using Foundation's `Process` to run subprocesses (command line invocations), the `arguments` passed in are passed to the command in a way that is safe in terms of shell command injection. For example, imagine you are accepting user input to process it with a command line tool. Let's simulate this tool with `/bin/echo`:

```swift
let userInput = "foo"
try Process.run(.init(fileURLWithPath: "/bin/echo"),
                arguments: [userInput])
```

This will log `foo` to the console. Next, let's assume a user provides the following input:

```swift
try Process.run(.init(fileURLWithPath: "/bin/echo"),
                arguments: [userInput])
```

Because `Process` escapes its `arguments` parameter, this safely logs `foo ; ls /bin` to the console.

However, this hinges on the initial command being a simple command that does not itself interpret the user input. This changes if the process is launched as follows:

```swift
try Process.run(.init(fileURLWithPath: "/bin/bash"),
                arguments: ["-c", "echo \(userInput)"])
```

Running this command will (depending on other security mechanisms like the sandbox) list the contents of the `/bin` directory:

```
[		dd		launchctl	pwd		tcsh
bash		df		link		realpath	test
cat		echo		ln		rm		unlink
chmod		ed		ls		rmdir		wait4path
cp		expr		mkdir		sh		zsh
csh		hostname	mv		sleep
dash		kill		pax		stty
date		ksh		ps		sync
```

While this may look like a somewhat contrived example, it is possible to accidentally process commands in this way for instance in case a third party library were to execute commands in this way.
