#!/usr/bin/env bash
set -e

echo "🧹 Docker cleanup started..."

# -----------------------------
# Stop & remove exited containers
# -----------------------------
echo "🛑 Removing stopped containers..."
docker container prune -f

# -----------------------------
# Remove dangling & unused images
# -----------------------------
echo "🖼️  Removing unused images..."
docker image prune -a -f

# -----------------------------
# Remove unused volumes
# -----------------------------
echo "💾 Removing unused volumes..."
docker volume prune -f

# -----------------------------
# Remove unused networks
# -----------------------------
echo "🌐 Removing unused networks..."
docker network prune -f

# -----------------------------
# Remove build cache
# -----------------------------
echo "🧱 Removing build cache..."
docker builder prune -a -f

echo "✅ Docker cleanup complete."
