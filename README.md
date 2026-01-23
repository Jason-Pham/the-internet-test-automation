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

### Run in Parallel (Faster)

To run tests in parallel using Pabot:

```bash
pabot --testlevelsplit tests/
```

## Structure

-   `tests/`: Contains test suites (`.robot` files).
-   `resources/`: Contains shared keywords, locators, and variables.
    -   `keywords/`: Higher-level keywords.
    -   `locators/`: UI element locators.
    -   `variables/`: Global configuration and test data.
    -   `environments/`: Environment-specific config files (dev, staging, prod).

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
