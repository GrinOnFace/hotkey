#Persistent
#NoEnv
#SingleInstance Force

Gui, +AlwaysOnTop +ToolWindow -Caption +E0x20  ; Окно без рамок и поверх всех окон
Gui, Color, 000000  ; Чёрный фон
Gui, Font, s18 cFFFFFF, Arial  ; Белый текст, размер 18, шрифт Arial

; Добавляем текст с JS-кодом белого цвета
Gui, Add, Text, Center, 🔥 цауацауауFrontend - это магия! 🔥`nHTML, CSS, JavaScript — сила в твоих руках!`n
Gui, Add, Text, Center, `nПример JS-кода:`n
Gui, Font, s16 cFFFFFF, Consolas  ; Белый цвет и моноширинный шрифт
Gui, Add, Text, Center, `nfunction factorial(n) {`n return n <= 1 ? 1 : n * factorial(n - 1); `n}`nconsole.log(factorial(5));

; Получаем размер экрана
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight

; Вычисляем новую позицию (чуть выше и левее центра)
X := ScreenWidth/2 - 300  ; Левее
Y := ScreenHeight/2 - 150  ; Выше

; Размещаем окно
Gui, Show, x%X% y%Y% w1000 h600, FrontendOverlay

WinSet, Transparent, 120, FrontendOverlay  ; Повышенная прозрачность (120 вместо 180)

return

Esc::ExitApp  ; Закрытие по Esc
