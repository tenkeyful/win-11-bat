> [!NOTE]
> Part of my [Windows 11 Order of Business](https://github.com/tenkeyful/win-11-ofb).

Like it or not, I do get BSOD every now and then. To fix my Windows machine, I have to search up commands on my phone, which I'm tired of doing so. Therefore, I decided to learn a little bit of Batch scripting so that I can make a simple script that automatically runs the commands in question.

Same goes for when Wi-Fi in Action Center says `No internet, secured`. Most tutorials teach bullshit like `ipconfig /flushdns` (that only deletes temporarily stored DNS records for fucking god's sake 🫩), so I got the commands from [memstechtips](https://memstechtips.com/fix-slow-internet-windows-11/) whom I watch his YouTube videos frequently.

I run a blog, and I'm tired of manually `Ctrl` + `R` → type C → arrow → Enter → click on Address bar → type `code .` → `Ctrl` + `backtick` → type `npm run dev`. So I wrote another `.bat` file.

I rarely if not ever have a duplication file issue but in case I do, I might use [this Chinese guy's PowerShell script](https://github.com/zouyonghe/remove-duplicate-files).

Right now it's just these 3 tasks, because most of my other ones are already automated/have software to do so, like PowerToys' PowerRename utility. If I ever write another `.bat` file because I couldn't automate it/find a software, then I'll upload it here.

---

The problem is that, well, I'm not a Windows sysadmin. Unlike JS or Cpp, I don't have an obligation to learn and use Batch scripting everyday, so inevitably I will forget how to write a `.bat` file. Below is a quick (not comprehensive) reference for my future self.

```bat
@echo off
echo Hello, world!
pause
```
- Without `@echo off`, CMD/Terminal displays each command before executing it.
- `pause` = Press any key to continue...
- `echo.` prints an empty line.
- `cls` clears the CMD/Terminal window.
- `rem` or `::` to write a comment, Batch scripting unfortunately doesn't support inline comment.

```bat
set name=Windows
echo %name%
```
- Wrap `var=[STR_WITH_WHITESPACE]` in quotation marks to prevent accidental trailing spaces from becoming part of the variable value.

```bat
set /p name=Enter your name: 
echo Hello, %name%!
```

```bat
set /a result=10+20
echo %result%
```

```bat
set /p answer=Continue? (Y/N): 

if /i "%answer%"=="Y" (
    echo Continuing...
) else (
    echo Cancelled.
)
```
- `/i` makes the comparison case-insensitive.
- Look into comparison operators, I can't be bothered to write more examples.

```bat
if exist "example.txt" (
    echo File found!
) else (
    echo File not found!
)
```

```bat
[INSERT_COMMAND]

if errorlevel 1 (
    echo The command reported an error.
) else (
    echo Command completed successfully.
)
```
- `errorlevel`: 0 = success, nonzero = error

```bat
@echo off

:start
echo Hello!

set /p answer=Run again? (Y/N): 

if /i "%answer%"=="Y" goto start

echo Goodbye!
pause
```
- A label begins with `:`.
- `goto` jumps to that label.

```bat
for %%i in (1 2 3 4 5) do (
    echo Number: %%i
)
```
- Inside a .bat file, use `%%i`. In CMD, use `%i`.

```bat
for %%f in (*.txt) do (
    echo Found: %%f
)
```

```bat
exit /b
```
- Exits the current Batch script or subroutine without necessarily closing the parent CMD session.

```bat
call another-script.bat
```

```bat
setlocal

set "example=Hello"

echo %example%
```
- Keep variable changes local to the script.

It's good enough for me. I can use LLMs to help cover other Batch scripting knowledge I don't have to know like special characters and environment variables. Batch scripts can also run CMD commands: [40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A "NetworkChuck")
