@echo off
if "%1"=="sayHello" (
	python dataManager.py sayHello
) else if "%1"=="test" (
	python dataManager.py test
) else if "%1"=="insertDictData" (
	python dataManager.py insertDictData
) else if "%1"=="exportDictData" (
	python dataManager.py exportDictData
) else if "%1"=="insertEnumData" (
	python dataManager.py insertEnumData
) else if "%1"=="exportEnumData" (
	python dataManager.py exportEnumData
) else if "%1"=="help" (
	echo dataManager command:
	echo dataManager sayHello
	echo usable command:
	echo     sayHello
	echo     test
	echo     insertDictData
	echo     exportDictData
	echo     insertEnumData
	echo     exportEnumData
) else (
	echo wrong command
)