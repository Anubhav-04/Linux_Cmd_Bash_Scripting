#!/bin/bash

# Deploy a Django app and handle errors

# Function to clone the Django app code
code_clone() {
    echo "Cloning the Django app..."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists. Skipping clone."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to clone the code."
            return 1
        }
    fi
}

# Function to install required dependencies
install_requirements() {
    echo "Installing dependencies..."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Uncomment the following lines if needed:
     sudo systemctl enable docker
     sudo systemctl enable nginx
     sudo systemctl restart docker
     docker-compose up -d
}

# Function to deploy the Django app
deploy() {
    echo "Building and deploying the Django app..."
    	cd django-notes-app
	docker build -t notes-app . && docker-compose up -d ||{
        echo "Failed to build and deploy the app."
        return 1
    }
}

# Main deployment script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
    code_clone
    cd django-notes-app || exit 1

# Install dependencies
if ! install_requirements; then
	echo "Error in installing Dependencies"
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"

