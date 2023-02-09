# Use a Python image as the base image
FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the code into the container
COPY . /app

# Install the required libraries
RUN pip install pandas re

# Set the command to run the code
CMD ["python", "time_checker.ipynb"]
