# Base image
FROM debian:latest

# Update package lists & install basic dependencies
RUN apt update && \
    apt install -y \
    curl \
    wget \
    bzip2 \
    build-essential

# Install Python
RUN apt install -y \
    python3 \
    python3-pip

# Install Anaconda
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh && \
    bash Anaconda3-2023.09-0-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm Anaconda3-2023.09-0-Linux-x86_64.sh

# Add Anaconda to the PATH
ENV PATH="/opt/anaconda3/bin:${PATH}"

# Install Rust and its toolchain
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Add cargo to the PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Setup working directory
WORKDIR /app

# Copy application to Docker filesystem
COPY . /app

# Run application
CMD [ "python", "test.py" ]

