# Robot Framework Starter (VS Code)

This is a minimal, production-friendly starter to write Robot tests in VS Code using the Playwright-based **Browser** library.

# Robot Framework (Playwright) – CI

[![Robot CI](https://github.com/knatha/Robot_Framework_Python/actions/workflows/robot.yml/badge.svg)](https://github.com/knatha/Robot_Framework_Python/actions/workflows/robot.yml)
[![Allure Report](https://img.shields.io/badge/Allure-Report-blueviolet)](https://knatha.github.io/Robot_Framework_Python/)
[![GitHub Pages](https://img.shields.io/badge/GitHub-Pages-2ea44f)](https://knatha.github.io/Robot_Framework_Python/)

- **Live Allure report:** https://knatha.github.io/Robot_Framework_Python/  
- **Workflow runs:** https://github.com/knatha/Robot_Framework_Python/actions

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
