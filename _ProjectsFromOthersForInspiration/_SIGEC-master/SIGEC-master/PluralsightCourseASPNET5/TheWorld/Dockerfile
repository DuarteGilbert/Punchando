FROM microsoft/aspnet:1.0.0-rc1

COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 15017/tcp
ENTRYPOINT ["dnx", "-p", "project.json", "web"]
