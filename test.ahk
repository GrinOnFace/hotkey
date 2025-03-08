#Persistent
#NoEnv
#SingleInstance Force

Gui, +AlwaysOnTop +ToolWindow -Caption +E0x20  ; Окно без рамок и поверх всех окон
Gui, Color, 000000  ; Чёрный фон
Gui, Font, s18 cFFFFFF, Arial  ; Белый текст, размер 18, шрифт Arial
Gui, Add, Text, Center, 🔥 Frontend - это магия! 🔥`nHTML, CSS, JavaScript — сила в твоих руках!`n
Gui, Add, Text, Center, `n!ецеу!Пример JS-кода:`n
Gui, Add, Text, Center, `nfunction factorial(n) {`n return n <= 1 ? 1 : n * factorial(n - 1); `n}`nconsole.log(factorial(5));

; Получаем размер экрана
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight

; Вычисляем позицию окна
X := ScreenWidth/2 - 250
Y := ScreenHeight/2 - 50

; Размещаем окно по центру
Gui, Show, x%X% y%Y% w1000 h600, FrontendOverlay

WinSet, Transparent, 180, FrontendOverlay  ; Прозрачность (0-255)

return

Esc::ExitApp  ; Закрытие по Esc