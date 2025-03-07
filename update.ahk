Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Ссылка на твой файл
DownloadPath := A_ScriptDir "\test.ahk"  ; Сохраняем файл в ту же папку, где лежит update.ahk

; Функция обновления файла
CheckForUpdate() {
    global Url, DownloadPath
    UrlDownloadToFile, %Url%, %DownloadPath%

    ; Проверяем, скачался ли новый файл
    if FileExist(DownloadPath) {
        Process, Close, AutoHotkey.exe  ; Закрываем старую версию
        Sleep, 1000  ; Ждём 1 сек для корректного завершения
        Run, %DownloadPath%  ; Запускаем новую версию
    } else {
        MsgBox, Ошибка: файл test.ahk не скачался!
    }
}

; Первая проверка при запуске
CheckForUpdate()

; Устанавливаем таймер на проверку обновлений каждую минуту
SetTimer, CheckForUpdate, 60000
return
