// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "ScriptBlueprintFunctionLibrary.generated.h"

/**
 * 
 */
UCLASS()
class LUAGAME_API UScriptBlueprintFunctionLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

    UFUNCTION(BlueprintCallable, meta = (DisplayName = "CallLuaByGlobalTable", Category = "UnLua Tutorial"))
    static void CallLuaByGlobalTable();

    UFUNCTION(BlueprintCallable, meta = (DisplayName = "CallLuaByFLuaTable", Category = "UnLua Tutorial"))
    static void CallLuaByFLuaTable();

    UFUNCTION(BlueprintCallable, meta = (DisplayName = "SetupCustomLoader", Category = "UnLua Tutorial"))
    static void SetupCustomLoader(int Index);
};
