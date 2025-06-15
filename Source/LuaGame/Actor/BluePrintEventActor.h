// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "UnLuaInterface.h"
#include "BluePrintEventActor.generated.h"

UCLASS()
class LUAGAME_API ABluePrintEventActor : public AActor , public IUnLuaInterface
{
	GENERATED_BODY()
	
public:	
	// Sets default values for this actor's properties
	ABluePrintEventActor();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	UFUNCTION(BlueprintNativeEvent, Category = "Blue")
	FString SayHi(const FString& Name);
};
