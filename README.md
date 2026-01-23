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
