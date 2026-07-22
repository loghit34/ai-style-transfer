#!/bin/bash
# Build script for deployment (Render, Railway, etc.)
# Installs PyTorch CPU-only wheels to keep the image size small
pip install torch==2.2.2 torchvision==0.17.2 --index-url https://download.pytorch.org/whl/cpu
pip install -r requirements.txt
