FROM debian:buster-slim
RUN apt-get update && apt install \
    git \
    libpcap-dev \
    cmake \
    libgtest-dev \
    libtins-dev \
    build-essential -y \
  && cd /usr/src/googletest && cmake . && cmake --build . --target install \
  && git clone https://github.com/exatel/libnetflow9.git /app
WORKDIR /app/build
RUN mkdir build && cmake .. -DNF9_BUILD_EXAMPLES=ON && make -j4

CMD ["/bin/sh","-c","./examples/simple/example-simple 12345 > /dev/stdout"]
