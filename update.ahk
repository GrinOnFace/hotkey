Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Ссылка на актуальный скрипт
DownloadPath := A_ScriptDir "\test.ahk"

^!t::  ; Горячая клавиша: Ctrl + Alt + T
    ; Удаляем старый файл
    if FileExist(DownloadPath) {
        FileDelete, %DownloadPath%
    }

    ; Генерируем уникальный URL, чтобы обойти кеширование
    UniqueUrl := Url "?nocache=" A_TickCount
    UrlDownloadToFile, %UniqueUrl%, %DownloadPath%

    ; Проверяем, скачался ли новый файл
    if FileExist(DownloadPath) {
        Run, %DownloadPath%  ; Запускаем test.ahk
    }
return