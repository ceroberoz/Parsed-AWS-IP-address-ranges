#!/bin/bash

# Define the URL to retrieve data from
apiEndpoint="https://ip-ranges.amazonaws.com/ip-ranges.json"

# Data file with timestamp prefix
dataFile="ip_ranges_data_$(date +'%Y%m%d%H%M%S').json"

# Perform the curl command to get data from the specified URL
curl -s "$apiEndpoint" > "$dataFile"

# Function to log messages with timestamps
log() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1" >> "script_log.txt"
}

# Function to create folders based on service and region
organizeFolders() {
    local service=$1
    local region=$2

    # Create folders if they don't exist
    mkdir -p "$service/$region/ipv4"
    mkdir -p "$service/$region/ipv6"

    # Extract and save IPv4 addresses
    jq -r --arg service "$service" --arg region "$region" '.prefixes[] | select(.service == $service and .region == $region) | .ip_prefix' "$dataFile" > "$service/$region/ipv4/ipv4.txt"

    # Extract and save IPv6 addresses
    jq -r --arg service "$service" --arg region "$region" '.ipv6_prefixes[] | select(.service == $service and .region == $region) | .ipv6_prefix' "$dataFile" > "$service/$region/ipv6/ipv6.txt"
}

# Extract distinct service types
services=$(jq -r '.prefixes[].service' "$dataFile" | sort -u)

# Iterate over each service type
for service in $services; do
    log "Processing service: $service"

    # Extract distinct regions for the current service
    regions=$(jq -r --arg service "$service" '.prefixes[] | select(.service == $service) | .region' "$dataFile" | sort -u)

    # Iterate over each region for the current service
    for region in $regions; do
        log "Processing region: $region"

        # Organize folders and save IPv4 and IPv6 addresses
        organizeFolders "$service" "$region"
    done
done

log "Script execution completed successfully."
