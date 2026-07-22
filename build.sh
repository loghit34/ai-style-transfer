#!/bin/bash
# Build script for deployment (Render, Railway, etc.)
# Installs PyTorch CPU-only wheels to keep the image size small
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
pip install -r requirements.txt
