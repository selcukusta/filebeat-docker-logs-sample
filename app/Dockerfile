FROM microsoft/dotnet:2.1-sdk-alpine AS build-env
COPY . /app
WORKDIR /app
RUN dotnet publish -c Release -o publish-folder -r linux-musl-x64
FROM microsoft/dotnet:2.1-aspnetcore-runtime-alpine
COPY --from=build-env /app/publish-folder ./
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
ENTRYPOINT ["dotnet", "app.dll"]