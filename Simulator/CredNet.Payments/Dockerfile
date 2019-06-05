FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["Simulator/CredNet.Payments/CredNet.Payments.csproj", "Simulator/CredNet.Payments/"]
RUN dotnet restore "Simulator/CredNet.Payments/CredNet.Payments.csproj"
COPY . .
WORKDIR "/src/Simulator/CredNet.Payments"
RUN dotnet build "CredNet.Payments.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "CredNet.Payments.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "CredNet.Payments.dll"]