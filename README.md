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

## Structure

-   `tests/`: Contains test suites (`.robot` files).
-   `resources/`: Contains shared keywords, locators, and variables.
    -   `keywords/`: Higher-level keywords.
    -   `locators/`: UI element locators.
    -   `variables/`: Global configuration and test data.
