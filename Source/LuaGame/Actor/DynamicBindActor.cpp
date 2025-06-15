// Fill out your copyright notice in the Description page of Project Settings.


#include "DynamicBindActor.h"

// Sets default values
ADynamicBindActor::ADynamicBindActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void ADynamicBindActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void ADynamicBindActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

