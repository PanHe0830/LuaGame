// Copyright Epic Games, Inc. All Rights Reserved.

#include "LuaGameGameMode.h"
#include "LuaGameCharacter.h"
#include "UObject/ConstructorHelpers.h"

ALuaGameGameMode::ALuaGameGameMode()
{
	// set default pawn class to our Blueprinted character
	static ConstructorHelpers::FClassFinder<APawn> PlayerPawnBPClass(TEXT("/Game/ThirdPerson/Blueprints/BP_ThirdPersonCharacter"));
	if (PlayerPawnBPClass.Class != NULL)
	{
		DefaultPawnClass = PlayerPawnBPClass.Class;
	}
}
