FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 15098
EXPOSE 15099

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/Back/WatchDog/MAGVA.Back.WatchDog/MAGVA.Back.WatchDog.csproj", "src/Back/WatchDog/MAGVA.Back.WatchDog/"]
RUN dotnet restore "src/Back/WatchDog/MAGVA.Back.WatchDog/MAGVA.Back.WatchDog.csproj"
COPY . .
WORKDIR "/src/src/Back/WatchDog/MAGVA.Back.WatchDog"
RUN dotnet build "MAGVA.Back.WatchDog.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MAGVA.Back.WatchDog.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MAGVA.Back.WatchDog.dll"]