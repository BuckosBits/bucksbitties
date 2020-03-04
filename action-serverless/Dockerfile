FROM node:10-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/aaronpanch/action-serverless"
LABEL homepage="https://github.com/aaronpanch/action-serverless"
LABEL maintainer="Aaron Panchal <aaron.panchal@gmail.com>"

LABEL "com.github.actions.name"="GitHub Action for Serverless Framework"
LABEL "com.github.actions.description"="Wraps the Serverless CLI"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="gray-dark"

# Install serverless globally
RUN yarn global add serverless

ADD "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
FROM microsoft/dotnet:2.2-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src/Fabrikam.Workflow.Service

COPY Fabrikam.Workflow.Service/Fabrikam.Workflow.Service.csproj .
RUN dotnet restore Fabrikam.Workflow.Service.csproj

COPY Fabrikam.Workflow.Service/. .
RUN dotnet build Fabrikam.Workflow.Service.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Fabrikam.Workflow.Service.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Fabrikam.Workflow.Service.dll"]
FROM build AS testrunner
WORKDIR /src/tests

COPY Fabrikam.Workflow.Service.Tests/*.csproj .
RUN dotnet restore Fabrikam.Workflow.Service.Tests.csproj

COPY Fabrikam.Workflow.Service.Tests/. .
ENTRYPOINT ["dotnet", "test", "--logger:trx"]
docker build . -t delivery-test:1 --target=testrunner
docker run -p 8080:8080 delivery-test:1
