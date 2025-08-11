# Robot Framework Starter (VS Code)

This is a minimal, production-friendly starter to write Robot tests in VS Code using the Playwright-based **Browser** library.

## Quick Start
```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux:
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

# One-time: download Playwright browsers
rfbrowser init

# Run tests
robot -d results tests
```

## Parallel runs
```bash
pabot -d results --processes 4 tests
```

## Allure report (optional)
```bash
# after run
allure serve results/allure
```

## Structure
```
.
├─ .vscode/            # VS Code tasks & settings
├─ configs/            # optional configs
├─ libs/               # custom Python keywords
├─ resources/pages/    # page-model keywords
├─ tests/              # test suites
└─ requirements.txt
```
