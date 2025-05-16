#!/bin/bash

# Container name
CONTAINER_NAME="harpia"

# Commands to run inside the container
INTERNAL_START_SCRIPT_COMMAND="bash /root/harpia_ws/src/start.sh && source /root/.bashrc"
INTERNAL_SETUP_SCRIPT_COMMAND="bash /root/config/entrypoint.sh"

# Create the .env file
echo "DOCKERFILE_PATH=$(pwd)/Dockerfile" > .env
echo "HOME=$HOME" >> .env

# Create the container
echo ""
echo "----------------------------------------------------------"
echo ""
echo "    Creating container..."
echo ""
echo "----------------------------------------------------------"
echo ""
if docker compose up -d; then
    echo "Container created successfully"
else
    echo "Failed to create container"
    exit 1
fi

# Function to run commands in container with status checking
run_in_container() {
    local command=$1
    local step_name=$2
    
    echo ""
    echo "----------------------------------------------------------"
    echo ""
    echo "    Running $step_name..."
    echo ""
    echo "----------------------------------------------------------"

    if docker exec "$CONTAINER_NAME" /bin/bash -c "$command"; then
        echo ""
        echo ">> $step_name completed successfully"
        echo ""
    else
        echo ""
        echo ">> $step_name failed"
        echo ""
        return 1
    fi
}

# Execute all steps

# Start
run_in_container "$INTERNAL_START_SCRIPT_COMMAND" "initial start" || exit 1

# Fisrt setup
run_in_container "$INTERNAL_SETUP_SCRIPT_COMMAND" "first setup" || exit 1

# Restart
docker restart "$CONTAINER_NAME" || exit 1

# Sencond setup
run_in_container "$INTERNAL_SETUP_SCRIPT_COMMAND" "second setup" || exit 1

# Restart
docker restart "$CONTAINER_NAME" || exit 1

# Third setup
run_in_container "$INTERNAL_SETUP_SCRIPT_COMMAND" "third setup" || exit 1

echo "##########################################"
echo "#                                        #"
echo "#  Harpia container is ready to use!     #"
echo "#  Run: docker exec -it harpia bash      #"
echo "#                                        #"
echo "##########################################"