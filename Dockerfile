FROM debian:buster-slim AS build
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
RUN mkdir build && cmake .. && make -j4

FROM debian:buster-slim
COPY --from=build /app/build/ /app/build/
RUN apt-get update \
  && apt-get install -y libtins-dev \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /app/build
CMD ["./test/netflowtests"]
