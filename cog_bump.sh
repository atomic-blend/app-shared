#!/bin/bash

current_version=$(grep 'version:' pubspec.yaml | awk '{print $2}')
echo "Current version: $current_version"

# Remove the 'v' prefix if present and update the version in pubspec.yaml
new_version="${1#v}"

# Update the version in pubspec.yaml
sed "s/version: .*/version: $new_version/" pubspec.yaml > temp.yaml && mv temp.yaml pubspec.yaml

echo "Version updated to $new_version"
