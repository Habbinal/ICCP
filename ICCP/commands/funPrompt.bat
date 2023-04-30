@echo off

title Fun Prompt!
color 2
set /p PromptAesthetic=Select your prompt design:
echo Grey
echo Iris
echo.
if %PromptAesthetic% == Grey color 8f
if %PromptAesthetic% == Iris color df
if not defined %PromptAesthetic% echo Select a design!
if not %PromptAesthetic% == Grey or Iris echo That isn't a design!