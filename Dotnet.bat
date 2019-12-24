dotnet --version
dotnet --help

node -v
npm install -g bower@1.8.0

dotnet new console
dotnet restore
dotnet run

dotnet new mvc --language C# --auth None --framework netcoreapp3.0
dotnet restore
