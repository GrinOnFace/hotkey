Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Твой URL
DownloadPath := A_ScriptDir "\test.ahk"

^!t::
    ; Удаляем старый файл перед скачиванием
    if FileExist(DownloadPath) {
        FileDelete, %DownloadPath%
    }

    ; Скачиваем последнюю версию с GitHub
    UrlDownloadToFile, %Url%, %DownloadPath%

    ; Проверяем, скачался ли файл
    if FileExist(DownloadPath) {
        Run, %DownloadPath%  ; Запускаем test.ahk
    }
return
