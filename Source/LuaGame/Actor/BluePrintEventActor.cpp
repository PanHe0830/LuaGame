// Fill out your copyright notice in the Description page of Project Settings.


#include "BluePrintEventActor.h"
#include "Kismet/GameplayStatics.h"

// Sets default values
ABluePrintEventActor::ABluePrintEventActor()
{
 	// Set this actor to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

}

// Called when the game starts or when spawned
void ABluePrintEventActor::BeginPlay()
{
	Super::BeginPlay();
	
}

// Called every frame
void ABluePrintEventActor::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);

}

FString ABluePrintEventActor::SayHi_Implementation(const FString& Name)
{
	//UKismetSystemLibrary::PrintString(GetWorld(),"123");
	FString ret;
	if (Name.IsEmpty())
	{
		ret = "name is nullptr";
	}
	else
	{
		ret = "This is C++ code" + Name;
	}
	UE_LOG(LogTemp, Warning, TEXT("%s"), *Name);
	return Name; 
	// 一个问题，如果在UE编辑器打开的情况下改变函数的返回值会报 PrintString的第六个参数是空，
	// 第六个参数是一个float类型的值代表持续时间，不知道为什么会报错
	// 如果打开后再编译也会报错，在进行编译崩溃退出
	// 编译的过程什么代码都没改，只让代码有修改，例如给个回车

	GetWorld()->SpawnActor<AActor>();
}

