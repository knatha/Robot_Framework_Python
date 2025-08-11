import os

HEADLESS = os.getenv("HEADLESS", "True").lower() in ("1", "true", "yes")
BROWSER = os.getenv("BROWSER", "chromium")  # chromium | firefox | webkit

# SauceDemo test credentials
VALID_USERNAME = os.getenv("APP_USERNAME", "standard_user")
VALID_PASSWORD = os.getenv("APP_PASSWORD", "secret_sauce")
