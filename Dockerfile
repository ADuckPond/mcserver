FROM golang:latest

RUN mkdir /app
COPY runSrv.sh /app/runSrv.sh
RUN apt-get update -y && apt-get install default-jdk wget -y && useradd -g root mc && chown mc:root /app /app/runSrv.sh && chmod +x /app/runSrv.sh

USER mc
WORKDIR /app
RUN wget https://s3.amazonaws.com/Minecraft.Download/versions/1.12/minecraft_server.1.12.jar && java -Xms256M -Xmx512M -jar minecraft_server.1.12.jar -o true && rm eula.txt && echo eula=true > eula.txt && rm server.properties

CMD ["/app/runSrv.sh"]