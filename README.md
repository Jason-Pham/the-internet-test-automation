# The Internet Test Automation

This project contains automated tests for [The Internet](https://the-internet.herokuapp.com/) using **Robot Framework** and **Playwright** (Browser Library).

## Prerequisites

-   Python 3.8+
-   Node.js 14+

## Installation

1.  **Clone the repository**:
    ```bash
    git clone <repository_url>
    cd the-internet-test-automation
    ```

2.  **Create and activate a virtual environment**:
    ```bash
    python3 -m venv .venv
    source .venv/bin/activate
    ```

3.  **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

4.  **Initialize Playwright browsers**:
    ```bash
    rfbrowser init
    ```

## Running Tests

To run the login tests:

```bash
robot tests/login_tests.robot
```



To generate beautiful reports, you first need to install Allure.

**Mac (Homebrew):**
```bash
brew install allure
```

**Generate Reports:**


1.  Run tests with Allure listener:
    ```bash
    robot --listener allure_robotframework:allure_results tests/
    ```
2.  Serve the report:
    ```bash
    allure serve allure_results
    ```

### Run in Parallel (Faster)

To run tests in parallel using Pabot:

```bash
pabot --testlevelsplit tests/
```

### Run with Docker (Recommended)

To run tests in a containerized environment (ensures consistency):

```bash
# Run tests
docker-compose up --build
```


## Structure

-   `tests/`: Contains test suites (`.robot` files).
-   `resources/`: Contains shared keywords, locators, and variables.
    -   `keywords/`: Higher-level keywords.
    -   `locators/`: UI element locators.
    -   `variables/`: Global configuration and test data.
    -   `environments/`: Environment-specific config files (dev, staging, prod).

## Pre-Push Quality Gates

A `pre-push` git hook runs automatically on every `git push`. **Gates 1–3 block the push on failure. Gate 4 warns but does not block.**

| Gate | What it checks | Blocks push? |
|------|---------------|--------------|
| **Robocop lint** | Naming conventions, `[Documentation]` tags on every keyword, line length | Yes |
| **Robot dry run** | Import resolution, syntax errors across all test files | Yes |
| **Full test suite** | Every test (all tags: smoke, regression, security, etc.) run in parallel headless | Yes |
| **Docs check** | Warns if `.robot`/`.resource` files changed without a `README.md` update | No (warning only) |

### First-time setup

After cloning, make the hook executable:

```bash
chmod +x .git/hooks/pre-push
```

### Manual pre-push checks

Run the gates individually before pushing:

```bash
# Gate 1 — lint
robocop check .

# Gate 2 — syntax
robot --dryrun tests/

# Gate 3 — full suite
pabot --testlevelsplit --variablefile resources/environments/prod.yaml --variable HEADLESS:True -d results tests/
```

## Environment Configuration

To run tests against different environments:

```bash
# Dev (default)
pabot --testlevelsplit --variablefile resources/environments/dev.yaml tests/

# Staging
pabot --testlevelsplit --variablefile resources/environments/staging.yaml tests/

# Production
pabot --testlevelsplit --variablefile resources/environments/prod.yaml tests/
```
