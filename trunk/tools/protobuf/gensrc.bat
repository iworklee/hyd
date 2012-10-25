@echo off
cd %~dp0

rd /s/q C#
md C#
rd /s/q AS3
md AS3

:==================	sample	================
rem protobuf-csharp-port\ProtoGen.exe -output_directory=C# protos\tutorial\addressbook.proto
rem protoc --plugin=protoc-gen-as3=protoc-gen-as3\protoc-gen-as3.bat --as3_out=AS3 protos\tutorial\addressbook.proto


:==================	generate C# source using protobuf-csharp-port	================
rem for %%a in (protos\*.proto) do protobuf-csharp-port\ProtoGen.exe -output_directory=C# %%a


:==================	generate AS3 source using protoc-gen-as3	================
for %%a in (protos\*.proto) do protoc --plugin=protoc-gen-as3=protoc-gen-as3\protoc-gen-as3.bat --as3_out=AS3 %%a


:==================	generate C# source using protobuf-net	================
FOR /f "tokens=1 delims=." %%F IN ('dir /b protos\*.proto') DO (
"protobuf-net\protogen" "-i:protos\%%F.proto" "-o:C#\%%F.cs"
)

pause