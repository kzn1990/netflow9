FROM debian:stretch-slim
run apt-get update && apt-get install softflowd -y
CMD ["softflowd","-r","/tmp/test.pcap","-n","libnetflow9:12345","-v","9"]
