#Persistent
#NoEnv
#SingleInstance Force

Gui, +AlwaysOnTop +ToolWindow -Caption +E0x20  ; Окно без рамок и поверх всех окон
Gui, Color, 000000  ; Чёрный фон
Gui, Font, s18 cFFFFFF, Arial  ; Ярко-белый текст, размер 18, шрифт Arial

; Добавляем текст с JS-кодом
Gui, Add, Text, Center, 🔥 Test1 - это магия! 🔥`nHTML, CSS, JavaScript — сила в твоих руках!`n
Gui, Add, Text, Center, `nПример JS-кода:`n
Gui, Font, s16 cFFFFFF, Consolas  ; Белый цвет и моноширинный шрифт
Gui, Add, Text, Center, `nfunction factorial(n) {`n return n <= 1 ? 1 : n * factorial(n - 1); `n}`nconsole.log(factorial(5));

; Получаем размер экрана
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight

; Вычисляем новую позицию (правый нижний угол)
Width := 500
Height := ScreenHeight * 2 / 3  ; 2/3 высоты экрана
Margin := 40  ; Увеличенный отступ от края
X := ScreenWidth - Width - Margin
Y := ScreenHeight - Height - Margin

; Размещаем окно
Gui, Show, x%X% y%Y% w%Width% h%Height%, FrontendOverlay

WinSet, Transparent, 80, FrontendOverlay  ; Увеличенная прозрачность

return

Esc::ExitApp  ; Закрытие по Esc
