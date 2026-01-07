FROM python:3.12.10

# Instal SSH client
RUN apt-get update && apt-get install -y openssh-client

# Set enviorements variables
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy requirements.txt file
COPY requirements.txt /app/requirements.txt

# Install python dependencies
RUN pip install -r requirements.txt

# Copy the application to the working directory
COPY . /app

# Start the SHH tunnel
CMD python manage.py runserver 0.0.0.0:8000