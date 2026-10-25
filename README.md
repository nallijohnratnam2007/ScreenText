# ScreenText

**Copy text from any visible screen region into editable text.**

ScreenText is a local-first Windows desktop utility. Draw a rectangle around text, run OCR locally with Tesseract, then copy or save the recognized text.

## Features

- Select a rectangular screen region (`Ctrl+Shift+S` while the app is focused)
- Local OCR with Tesseract
- Open an existing image for OCR
- Edit recognized text before copying or saving
- Save as UTF-8 `.txt`
- No account, API key, or cloud upload

## Requirements

- Windows 10/11
- Python 3.10+ for running from source
- Tesseract OCR engine with English language data

## Install Tesseract

Install the Windows Tesseract distribution from:
https://github.com/UB-Mannheim/tesseract/wiki

Include English language data. Ensure `tesseract.exe` is on PATH, then restart PowerShell.

Verify:

```powershell
tesseract --version
tesseract --list-langs
```

The language list should include `eng`.

## Run from source

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
python app.py
```

If PowerShell blocks activation, run this in the current terminal:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1
```

## Use it

1. Open ScreenText.
2. Click **Select screen region**, or press `Ctrl+Shift+S` while the app is focused.
3. Drag around the text and release.
4. Wait for recognition.
5. Edit the output if needed.
6. Click **Copy text** or **Save as .txt…**.

You can also choose **Open image…** to recognize an existing image.

## Tests

```powershell
pip install -r requirements-dev.txt
python -m pytest -q
```

Tests cover image preprocessing. OCR accuracy depends on image quality, fonts, contrast, and installed language data.

## Build for Windows

```powershell
.\build_windows.bat
```

The application is built in `dist\ScreenText\`. Tesseract and its language data are separate dependencies; a Python executable build alone does not bundle them. For a self-contained release, bundle a compatible Tesseract distribution and `tessdata`, and follow their licenses.

## Privacy and safety

- OCR runs locally.
- Screenshots and recognized text are not sent to a server.
- Captured images are held in memory and are not automatically saved.
- Avoid capturing passwords, private messages, financial information, or other sensitive content.
- Protected video, elevated windows, remote desktops, and mixed-DPI multi-monitor setups may behave differently.

## Troubleshooting

**`TesseractNotFoundError`:** install Tesseract, add `tesseract.exe` to PATH, restart PowerShell, and check `tesseract --version`.

**No text detected:** select a larger region, use a clearer source, improve contrast, and avoid unrelated screen content.

**Selection coordinates are offset:** mixed-DPI monitor scaling can affect screen coordinates. Try one monitor first and include display scaling details in a bug report.

## Roadmap

- Global hotkey when other apps are focused
- Optional tray mode
- More OCR languages
- Preview image
- Bundled Tesseract installer/build
- Optional copy-on-completion

## Contributing

Issues and pull requests are welcome. Include Windows version, Python version, Tesseract version, and reproducible steps. Never attach private screenshots or sensitive text.

## License

MIT for this project's code. Tesseract and its language data have their own licenses; consult their distributions.
