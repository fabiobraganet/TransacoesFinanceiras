FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 15000

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/Front/TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras.csproj", "src/Front/TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras/"]
RUN dotnet restore "src/Front/TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras.csproj"
COPY . .
WORKDIR "/src/src/Front/TransacoesFinanceiras/MAGVA.Front.TransacoesFinanceiras"
RUN dotnet build "MAGVA.Front.TransacoesFinanceiras.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MAGVA.Front.TransacoesFinanceiras.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MAGVA.Front.TransacoesFinanceiras.dll"]