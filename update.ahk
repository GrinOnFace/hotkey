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

    ; Проверяем, скачался ли новый файл
    if FileExist(DownloadPath) {
        TrayTip, AutoHotkey, test.ahk обновлён! Нажми Ctrl + Alt + T, чтобы запустить
    } else {
        TrayTip, Ошибка, test.ahk не скачался! Проверь соединение.
    }
}

; Проверка обновлений раз в 5 минут (300 000 мс)
SetTimer, CheckForUpdate, 60000 
CheckForUpdate()  ; Запускаем первую проверку

; Горячая клавиша для запуска test.ahk (Ctrl + Alt + T)
^!t::
    if FileExist(DownloadPath) {
        Run, %DownloadPath%  ; Запускаем test.ahk
    } else {
        MsgBox, Ошибка: test.ahk отсутствует! Подожди обновление.
    }
return