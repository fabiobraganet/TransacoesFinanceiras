FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 15001
EXPOSE 15002

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/Back/TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras.csproj", "src/Back/TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras/"]
RUN dotnet restore "src/Back/TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras.csproj"
COPY . .
WORKDIR "/src/src/Back/TransacoesFinanceiras/MAGVA.Back.TransacoesFinanceiras"
RUN dotnet build "MAGVA.Back.TransacoesFinanceiras.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MAGVA.Back.TransacoesFinanceiras.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MAGVA.Back.TransacoesFinanceiras.dll"]
