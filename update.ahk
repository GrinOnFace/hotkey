Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Твой URL
DownloadPath := A_ScriptDir "\test.ahk"

CheckForUpdate() {
    global Url, DownloadPath

    ; Удаляем старый файл перед скачиванием
    if FileExist(DownloadPath) {
        FileDelete, %DownloadPath%
    }

    ; Генерируем уникальный URL для обхода кеша
    UniqueUrl := Url "?nocache=" A_TickCount
    UrlDownloadToFile, %UniqueUrl%, %DownloadPath%
}

; Проверка обновлений раз в минуту (60 000 мс)
SetTimer, CheckForUpdate, 60000
CheckForUpdate()  ; Запускаем первую проверку

; Горячая клавиша для запуска test.ahk (Ctrl + Alt + T)
^!t::
    if FileExist(DownloadPath) {
        Run, %DownloadPath%  ; Запускаем test.ahk
    }
return