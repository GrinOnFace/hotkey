Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Ссылка на твой файл
DownloadPath := A_Temp "\test.ahk"

; Скачиваем новый файл
UrlDownloadToFile, %Url%, %DownloadPath%

; Проверяем, скачался ли файл
if FileExist(DownloadPath) {
    Run, %DownloadPath%  ; Запускаем новый скрипт
} else {
    MsgBox, Ошибка: файл test.ahk не скачался!
}

; Устанавливаем таймер на проверку обновлений каждую минуту (60 000 мс)
SetTimer, CheckForUpdate, 6000

CheckForUpdate:
    UrlDownloadToFile, https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk, %A_Temp%\test.ahk
    if FileExist(A_Temp "\test.ahk") {
        Run, %A_Temp%\test.ahk
    }
return