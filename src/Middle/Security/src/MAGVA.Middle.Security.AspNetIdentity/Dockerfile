FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 14000

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/Middle/Security/src/MAGVA.Middle.Security.AspNetIdentity/MAGVA.Middle.Security.AspNetIdentity.csproj", "src/Middle/Security/src/MAGVA.Middle.Security.AspNetIdentity/"]
COPY ["src/Middle/Security/src/MAGVA.Middle.Security.Admin.EntityFramework/MAGVA.Middle.Security.Admin.EntityFramework.csproj", "src/Middle/Security/src/MAGVA.Middle.Security.Admin.EntityFramework/"]
RUN dotnet restore "src/Middle/Security/src/MAGVA.Middle.Security.AspNetIdentity/MAGVA.Middle.Security.AspNetIdentity.csproj"
COPY . .
WORKDIR "/src/src/Middle/Security/src/MAGVA.Middle.Security.AspNetIdentity"
RUN dotnet build "MAGVA.Middle.Security.AspNetIdentity.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MAGVA.Middle.Security.AspNetIdentity.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MAGVA.Middle.Security.AspNetIdentity.dll"]