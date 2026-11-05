# Stage 1: Build and publish as self-contained
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

WORKDIR /src

COPY ["WeatherApi.csproj", "./"]

RUN dotnet restore "WeatherApi.csproj"

COPY . .

RUN dotnet publish "WeatherApi.csproj" -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -o /app/publish

# Stage 2: Runtime image
FROM mcr.microsoft.com/dotnet/runtime-deps:10.0 AS final

WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 80

ENV ASPNETCORE_URLS=http://+:80

ENTRYPOINT ["./WeatherApi"]