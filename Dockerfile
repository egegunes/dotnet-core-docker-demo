FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# copy everything else and build app
COPY demo/. ./demo/
WORKDIR /app/demo
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/demo/out ./
ENTRYPOINT ["dotnet", "demo.dll"]
