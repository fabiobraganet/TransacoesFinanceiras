FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
EXPOSE 14001

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
WORKDIR /src
COPY ["src/Middle/Security/src/MAGVA.Middle.Security.Admin/MAGVA.Middle.Security.Admin.csproj", "src/Middle/Security/src/MAGVA.Middle.Security.Admin/"]
COPY ["src/GlobalBase/WebHost/MAGVA.GlobalBase.WebHost.Customization/MAGVA.GlobalBase.WebHost.Customization.csproj", "src/GlobalBase/WebHost/MAGVA.GlobalBase.WebHost.Customization/"]
COPY ["src/Middle/Security/src/MAGVA.Middle.Security.Admin.EntityFramework/MAGVA.Middle.Security.Admin.EntityFramework.csproj", "src/Middle/Security/src/MAGVA.Middle.Security.Admin.EntityFramework/"]
COPY ["src/Middle/Security/src/MAGVA.Middle.Security.Admin.BusinessLogic/MAGVA.Middle.Security.Admin.BusinessLogic.csproj", "src/Middle/Security/src/MAGVA.Middle.Security.Admin.BusinessLogic/"]
RUN dotnet restore "src/Middle/Security/src/MAGVA.Middle.Security.Admin/MAGVA.Middle.Security.Admin.csproj"
COPY . .
WORKDIR "/src/src/Middle/Security/src/MAGVA.Middle.Security.Admin"
RUN dotnet build "MAGVA.Middle.Security.Admin.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "MAGVA.Middle.Security.Admin.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "MAGVA.Middle.Security.Admin.dll"]