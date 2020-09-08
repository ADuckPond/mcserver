FROM golang:latest

RUN mkdir -p /app/logs
COPY runSrv.sh /app/runSrv.sh
COPY ops.json /app/ops.json
RUN apt-get update -y && apt-get install default-jdk wget -y
WORKDIR /app/
RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar && echo eula=true > eula.txt
RUN useradd -g root mc && chown -R mc:root /app && chmod +x /app/runSrv.sh /app/ops.json && chmod -R 770 /app

CMD ["/app/runSrv.sh"]