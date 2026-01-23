FROM mcr.microsoft.com/playwright:v1.49.0-jammy

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install Python and Pip
# The base image comes with Python 3, but we ensure pip is up to date
RUN apt-get update && apt-get install -y python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Initialize Browser Library (installs node dependencies)
# Note: The base image already has browsers, but rfbrowser init ensures the wrapper is ready.
# We skip browser download since they are in the image, but we need the node side of rfbrowser.
RUN rfbrowser init --skip-browsers

# Copy project files
COPY . .

# Default command to run tests
CMD ["pabot", "--testlevelsplit", "--outputdir", "results", "tests/"]
