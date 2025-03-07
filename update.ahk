Url := "https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk"  ; <-- Ссылка на твой файл
DownloadPath := A_Temp "\test.ahk"

; Скачиваем новый файл при старте
UrlDownloadToFile, %Url%, %DownloadPath%

; Проверяем, скачался ли файл
if FileExist(DownloadPath) {
    Process, Close, test.ahk  ; Закрываем старую версию перед запуском новой
    Sleep, 500  ; Небольшая пауза
    Run, %DownloadPath%  ; Запускаем новый скрипт
} else {
    MsgBox, Ошибка: файл test.ahk не скачался!
}

; Устанавливаем таймер на проверку обновлений каждую минуту (60 000 мс)
SetTimer, CheckForUpdate, 1000

CheckForUpdate:
    UrlDownloadToFile, https://raw.githubusercontent.com/GrinOnFace/hotkey/main/test.ahk, %A_Temp%\test.ahk
    
    if FileExist(A_Temp "\test.ahk") {
        Process, Close, test.ahk  ; Закрываем старую версию
        Sleep, 500  ; Небольшая пауза перед запуском
        Run, %A_Temp%\test.ahk  ; Запускаем новую версию
    }
return