// Fill out your copyright notice in the Description page of Project Settings.


#include "ScriptBlueprintFunctionLibrary.h"
#include "Kismet/KismetSystemLibrary.h"
#include "UnLua.h"

static void PrintScreen(const FString& Msg)
{
    UKismetSystemLibrary::PrintString(nullptr, Msg, true, false, FLinearColor(0, 0.66, 1), 100);
}

void UScriptBlueprintFunctionLibrary::CallLuaByGlobalTable()
{
    PrintScreen(TEXT("[C++]CallLuaByGlobalTable ��ʼ"));

    UnLua::FLuaEnv Env;
    const auto bSuccess = Env.DoString("G_BP_CallLua = require 'BP_CallLua'");
    check(bSuccess);

    const auto RetValues = UnLua::CallTableFunc(Env.GetMainState(), "G_BP_CallLua", "CallMe", 1.1f, 2.2f);
    check(RetValues.Num() == 1);

    const auto Msg = FString::Printf(TEXT("[C++]�յ�����Lua�ķ��أ����=%f"), RetValues[0].Value<float>());
    PrintScreen(Msg);
    PrintScreen(TEXT("[C++]CallLuaByGlobalTable ����"));
}

void UScriptBlueprintFunctionLibrary::CallLuaByFLuaTable()
{
    PrintScreen(TEXT("[C++]CallLuaByFLuaTable ��ʼ"));
    UnLua::FLuaEnv Env;

    const auto Require = UnLua::FLuaFunction(&Env, "_G", "require");
    const auto RetValues1 = Require.Call("BP_CallLua");
    check(RetValues1.Num() == 2);

    const auto RetValue = RetValues1[0];
    const auto LuaTable = UnLua::FLuaTable(&Env, RetValue);
    const auto RetValues2 = LuaTable.Call("CallMe", 3.3f, 4.4f);
    check(RetValues2.Num() == 1);

    const auto Msg = FString::Printf(TEXT("[C++]�յ�����Lua�ķ��أ����=%f"), RetValues2[0].Value<float>());
    PrintScreen(Msg);
    PrintScreen(TEXT("[C++]CallLuaByFLuaTable ����"));
}

bool CustomLoader1(UnLua::FLuaEnv& Env, const FString& RelativePath, TArray<uint8>& Data, FString& FullPath)
{
    const auto SlashedRelativePath = RelativePath.Replace(TEXT("."), TEXT("/"));
    FullPath = FString::Printf(TEXT("%s%s.lua"), *GLuaSrcFullPath, *SlashedRelativePath);

    if (FFileHelper::LoadFileToArray(Data, *FullPath, FILEREAD_Silent))
        return true;

    FullPath.ReplaceInline(TEXT(".lua"), TEXT("/Index.lua"));
    if (FFileHelper::LoadFileToArray(Data, *FullPath, FILEREAD_Silent))
        return true;

    return false;
}

bool CustomLoader2(UnLua::FLuaEnv& Env, const FString& RelativePath, TArray<uint8>& Data, FString& FullPath)
{
    const auto SlashedRelativePath = RelativePath.Replace(TEXT("."), TEXT("/"));
    const auto L = Env.GetMainState();
    lua_getglobal(L, "package");
    lua_getfield(L, -1, "path");
    const char* Path = lua_tostring(L, -1);
    lua_pop(L, 2);
    if (!Path)
        return false;

    TArray<FString> Parts;
    FString(Path).ParseIntoArray(Parts, TEXT(";"), false);
    for (auto& Part : Parts)
    {
        Part.ReplaceInline(TEXT("?"), *SlashedRelativePath);
        FPaths::CollapseRelativeDirectories(Part);

        if (FPaths::IsRelative(Part))
            FullPath = FPaths::ConvertRelativePathToFull(GLuaSrcFullPath, Part);
        else
            FullPath = Part;

        if (FFileHelper::LoadFileToArray(Data, *FullPath, FILEREAD_Silent))
            return true;
    }

    return false;
}

void UScriptBlueprintFunctionLibrary::SetupCustomLoader(int Index)
{
    switch (Index)
    {
    case 0:
        FUnLuaDelegates::CustomLoadLuaFile.Unbind();
        break;
    case 1:
        FUnLuaDelegates::CustomLoadLuaFile.BindStatic(CustomLoader1);
        break;
    case 2:
        FUnLuaDelegates::CustomLoadLuaFile.BindStatic(CustomLoader2);
        break;
    }
}
