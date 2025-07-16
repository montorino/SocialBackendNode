# Полная шпаргалка по CSS (включая последние стандарты)

## Содержание
1. [Основы CSS](#основы-css)
2. [Селекторы](#селекторы)
3. [Блочная модель](#блочная-модель)
4. [Позиционирование](#позиционирование)
5. [Flexbox](#flexbox)
6. [Grid Layout](#grid-layout)
7. [Трансформации и переходы](#трансформации-и-переходы)
8. [Анимации](#анимации)
9. [Современные функции и переменные](#современные-функции-и-переменные)
10. [Адаптивный дизайн](#адаптивный-дизайн)
11. [CSS Modules и методологии](#css-modules-и-методологии)
12. [Новые CSS-свойства](#новые-css-свойства)
13. [Контейнерные запросы](#контейнерные-запросы)
14. [Логические свойства](#логические-свойства)
15. [Субгриды](#субгриды)
16. [Слои каскада](#слои-каскада)

## Основы CSS

### Подключение CSS
```css
/* Внешний файл CSS */
<link rel="stylesheet" href="styles.css">

/* Внутренний CSS */
<style>
  body { background-color: #f0f0f0; }
</style>

/* Встроенный CSS */
<p style="color: blue;">Текст</p>
```

### Синтаксис CSS
```css
селектор {
  свойство: значение;
  другое-свойство: значение;
}
```

### Комментарии
```css
/* Это комментарий в CSS */
```

### Цвета
```css
/* Именованные цвета */
color: red;

/* Шестнадцатеричные значения */
color: #ff0000; /* или сокращенно #f00 */

/* RGB */
color: rgb(255, 0, 0);

/* RGBA (с прозрачностью) */
color: rgba(255, 0, 0, 0.5); /* 50% прозрачность */

/* HSL (оттенок, насыщенность, светлота) */
color: hsl(0, 100%, 50%);

/* HSLA (с прозрачностью) */
color: hsla(0, 100%, 50%, 0.5);

/* Современный синтаксис с пробелами */
color: rgb(255 0 0 / 50%);
color: hsl(0 100% 50% / 50%);

/* Системные цвета */
color: Canvas;
color: CanvasText;
```

## Селекторы

### Базовые селекторы
```css
/* Универсальный селектор */
* { margin: 0; }

/* Селектор типа (тега) */
p { color: blue; }

/* Селектор класса */
.my-class { font-weight: bold; }

/* Селектор ID */
#unique-element { background-color: yellow; }

/* Селектор атрибута */
[type="text"] { border: 1px solid gray; }
```

### Комбинаторы
```css
/* Потомки (все вложенные элементы) */
div p { color: red; }

/* Дочерние элементы (только прямые потомки) */
div > p { color: blue; }

/* Смежные элементы (следующий элемент) */
h2 + p { margin-top: 0; }

/* Родственные элементы (все следующие элементы) */
h2 ~ p { color: green; }
```

### Псевдоклассы
```css
/* Состояния элементов */
a:hover { text-decoration: underline; }
a:active { color: red; }
a:visited { color: purple; }
input:focus { outline: 2px solid blue; }

/* Структурные псевдоклассы */
li:first-child { font-weight: bold; }
li:last-child { margin-bottom: 0; }
li:nth-child(odd) { background-color: #f0f0f0; }
li:nth-child(3n+1) { color: red; } /* каждый 1-й, 4-й, 7-й... */
p:only-child { font-style: italic; }

/* Отрицание */
:not(.special) { opacity: 0.8; }

/* Проверка содержимого */
:empty { display: none; }

/* Проверка валидности форм */
input:valid { border-color: green; }
input:invalid { border-color: red; }
input:required { background-color: #ffffd0; }

/* Проверка включения/выключения */
input:checked + label { font-weight: bold; }
input:disabled { opacity: 0.5; }
```

### Псевдоэлементы
```css
/* Первая буква */
p::first-letter { font-size: 2em; }

/* Первая строка */
p::first-line { font-weight: bold; }

/* Выделенный текст */
::selection { background-color: yellow; color: black; }

/* Генерация контента */
.info::before { content: "ℹ️ "; }
.warning::after { content: " ⚠️"; }

/* Маркеры списка */
li::marker { color: red; }

/* Заполнитель (placeholder) */
input::placeholder { color: #999; }
```

### Сложные селекторы
```css
/* Селектор с несколькими условиями */
input[type="text"][required] { border: 2px solid red; }

/* Селекторы с частичным совпадением атрибутов */
[class^="btn-"] { /* начинается с "btn-" */
  padding: 5px 10px;
}
[class*="icon"] { /* содержит "icon" */
  background-repeat: no-repeat;
}
[class$="-primary"] { /* заканчивается на "-primary" */
  color: blue;
}

/* Селектор :is() для группировки */
:is(h1, h2, h3) span { color: red; }
/* Эквивалентно: h1 span, h2 span, h3 span */

/* Селектор :where() (как :is(), но с нулевой специфичностью) */
:where(header, main, footer) p { line-height: 1.5; }
```

## Блочная модель

### Размеры
```css
/* Ширина и высота */
width: 300px;
height: 200px;
min-width: 100px;
max-width: 100%;
min-height: 50px;
max-height: 500px;

/* Процентные значения */
width: 50%; /* 50% от родителя */

/* Размер области просмотра */
width: 50vw; /* 50% ширины viewport */
height: 50vh; /* 50% высоты viewport */
min-height: 100vh; /* минимум на всю высоту экрана */

/* Новые единицы измерения */
width: 50dvw; /* динамическая ширина viewport */
height: 50dvh; /* динамическая высота viewport */
height: 50lvh; /* наименьшая высота viewport */
height: 50svh; /* наибольшая высота viewport */
```

### Отступы и границы
```css
/* Внутренние отступы (padding) */
padding: 10px; /* все стороны */
padding: 10px 20px; /* верх-низ право-лево */
padding: 10px 20px 15px 25px; /* верх право низ лево (по часовой) */
padding-top: 10px;
padding-right: 20px;
padding-bottom: 15px;
padding-left: 25px;

/* Границы (border) */
border: 1px solid black; /* ширина стиль цвет */
border-width: 1px;
border-style: solid; /* solid, dashed, dotted, double, groove, ridge, inset, outset */
border-color: black;

/* Отдельные стороны */
border-top: 2px dashed red;
border-right: 1px solid blue;
border-bottom: 3px dotted green;
border-left: 1px solid gray;

/* Радиус границы */
border-radius: 5px; /* все углы */
border-radius: 5px 10px 15px 20px; /* верхний-левый, верхний-правый, нижний-правый, нижний-левый */
border-radius: 50%; /* круг (для квадратного элемента) */
/* Эллиптические углы */
border-radius: 10px / 20px; /* горизонтальный/вертикальный радиус */

/* Внешние отступы (margin) */
margin: 10px; /* все стороны */
margin: 10px 20px; /* верх-низ право-лево */
margin: 10px 20px 15px 25px; /* верх право низ лево */
margin-top: 10px;
margin-right: 20px;
margin-bottom: 15px;
margin-left: 25px;
margin: 0 auto; /* горизонтальное центрирование */
margin: auto; /* центрирование при абсолютном позиционировании */

/* Отрицательные margin */
margin-top: -20px; /* сдвиг вверх */
```

### Box-sizing
```css
/* Стандартная модель (размер = контент) */
box-sizing: content-box;

/* Альтернативная модель (размер включает padding и border) */
box-sizing: border-box;

/* Применение ко всем элементам (популярный сброс) */
* {
  box-sizing: border-box;
}
```

### Тени
```css
/* Тень блока */
box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3); /* смещение-x смещение-y размытие цвет */
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* только размытие */
box-shadow: inset 0 0 5px #000; /* внутренняя тень */
box-shadow: 3px 3px 5px #999, -3px -3px 5px #f0f0f0; /* несколько теней */

/* Тень текста */
text-shadow: 1px 1px 2px black; /* смещение-x смещение-y размытие цвет */
text-shadow: 0 0 5px blue; /* свечение */
text-shadow: 1px 1px 0 white, -1px -1px 0 white; /* контур текста */
```

### Переполнение
```css
/* Управление переполнением */
overflow: visible; /* содержимое может выходить за границы (по умолчанию) */
overflow: hidden; /* обрезать выходящее содержимое */
overflow: scroll; /* всегда показывать полосы прокрутки */
overflow: auto; /* показывать полосы прокрутки при необходимости */

/* Раздельное управление */
overflow-x: hidden;
overflow-y: auto;

/* Обрезка текста */
text-overflow: ellipsis; /* многоточие при обрезке */
white-space: nowrap; /* запрет переноса строк */
overflow: hidden; /* нужен для работы text-overflow */
```

## Позиционирование

### Типы позиционирования
```css
/* Статическое (по умолчанию) */
position: static;

/* Относительное (смещение от нормального положения) */
position: relative;
top: 10px;
left: 20px;

/* Абсолютное (относительно ближайшего позиционированного предка) */
position: absolute;
top: 0;
right: 0;
bottom: 0;
left: 0;

/* Фиксированное (относительно окна просмотра) */
position: fixed;
top: 0;
left: 0;

/* Липкое (сочетание relative и fixed) */
position: sticky;
top: 20px; /* расстояние от верха окна, при котором элемент "прилипает" */
```

### Порядок наложения (z-index)
```css
/* Управление порядком наложения */
z-index: 1; /* выше элементов с меньшим z-index */
z-index: -1; /* ниже родительского элемента */
z-index: 9999; /* очень высокий приоритет */
```

### Обтекание
```css
/* Обтекание элементов */
float: left; /* обтекание справа */
float: right; /* обтекание слева */
float: none; /* отмена обтекания */

/* Очистка обтекания */
clear: left; /* очистка левого обтекания */
clear: right; /* очистка правого обтекания */
clear: both; /* очистка обоих обтеканий */

/* Clearfix (предотвращение схлопывания родителя) */
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```

### Отображение (display)
```css
/* Базовые значения */
display: block; /* блочный элемент */
display: inline; /* строчный элемент */
display: inline-block; /* строчно-блочный элемент */
display: none; /* скрытие элемента */

/* Таблицы */
display: table;
display: table-row;
display: table-cell;

/* Flexbox и Grid */
display: flex;
display: inline-flex;
display: grid;
display: inline-grid;

/* Новые значения */
display: contents; /* "растворяет" элемент, сохраняя его содержимое */
display: flow-root; /* создает новый контекст форматирования */
```

### Видимость и прозрачность
```css
/* Видимость (занимает место) */
visibility: visible;
visibility: hidden;

/* Прозрачность */
opacity: 1; /* полностью непрозрачный */
opacity: 0.5; /* полупрозрачный */
opacity: 0; /* полностью прозрачный, но интерактивный */
```

## Flexbox

### Контейнер Flex
```css
/* Объявление flex-контейнера */
display: flex;
display: inline-flex;

/* Направление основной оси */
flex-direction: row; /* слева направо (по умолчанию) */
flex-direction: row-reverse; /* справа налево */
flex-direction: column; /* сверху вниз */
flex-direction: column-reverse; /* снизу вверх */

/* Перенос элементов */
flex-wrap: nowrap; /* без переноса (по умолчанию) */
flex-wrap: wrap; /* перенос на новую строку */
flex-wrap: wrap-reverse; /* перенос с обратным порядком строк */

/* Сокращение для direction + wrap */
flex-flow: row wrap;

/* Выравнивание по основной оси */
justify-content: flex-start; /* в начале (по умолчанию) */
justify-content: flex-end; /* в конце */
justify-content: center; /* по центру */
justify-content: space-between; /* равномерно, крайние элементы по краям */
justify-content: space-around; /* равномерно с отступами вокруг */
justify-content: space-evenly; /* равномерно с одинаковыми отступами */

/* Выравнивание по поперечной оси */
align-items: stretch; /* растягивание (по умолчанию) */
align-items: flex-start; /* в начале */
align-items: flex-end; /* в конце */
align-items: center; /* по центру */
align-items: baseline; /* по базовой линии текста */

/* Выравнивание строк при переносе */
align-content: flex-start; /* в начале */
align-content: flex-end; /* в конце */
align-content: center; /* по центру */
align-content: space-between; /* равномерно, крайние строки по краям */
align-content: space-around; /* равномерно с отступами вокруг */
align-content: stretch; /* растягивание (по умолчанию) */

/* Интервал между элементами */
gap: 10px; /* одинаковый по обеим осям */
gap: 10px 20px; /* row-gap column-gap */
row-gap: 10px;
column-gap: 20px;
```

### Элементы Flex
```css
/* Порядок элемента */
order: 0; /* по умолчанию */
order: 1; /* более высокий порядок */
order: -1; /* более низкий порядок */

/* Растяжение элемента */
flex-grow: 0; /* не растягивается (по умолчанию) */
flex-grow: 1; /* растягивается */
flex-grow: 2; /* растягивается в два раза сильнее, чем с flex-grow: 1 */

/* Сжатие элемента */
flex-shrink: 1; /* сжимается (по умолчанию) */
flex-shrink: 0; /* не сжимается */
flex-shrink: 2; /* сжимается в два раза сильнее, чем с flex-shrink: 1 */

/* Базовый размер */
flex-basis: auto; /* по умолчанию */
flex-basis: 0; /* начинает с нуля перед применением flex-grow */
flex-basis: 200px; /* начальный размер 200px */
flex-basis: content; /* размер на основе содержимого */

/* Сокращение для grow, shrink и basis */
flex: 0 1 auto; /* значения по умолчанию */
flex: 1; /* flex: 1 1 0% - растягивается и сжимается */
flex: auto; /* flex: 1 1 auto - растягивается и сжимается с учетом содержимого */
flex: none; /* flex: 0 0 auto - не растягивается и не сжимается */

/* Индивидуальное выравнивание */
align-self: auto; /* наследует align-items контейнера */
align-self: flex-start;
align-self: flex-end;
align-self: center;
align-self: baseline;
align-self: stretch;
```

### Практические примеры Flexbox
```css
/* Центрирование элемента по горизонтали и вертикали */
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

/* Навигационное меню */
.nav {
  display: flex;
  list-style: none;
  padding: 0;
}
.nav li {
  margin-right: 20px;
}

/* Равные колонки */
.columns {
  display: flex;
}
.column {
  flex: 1;
  padding: 20px;
}

/* Прижатие футера к низу страницы */
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
main {
  flex: 1;
}
```

## Grid Layout

### Контейнер Grid
```css
/* Объявление grid-контейнера */
display: grid;
display: inline-grid;

/* Определение колонок */
grid-template-columns: 100px 200px 100px; /* 3 колонки с фиксированными размерами */
grid-template-columns: 1fr 2fr 1fr; /* 3 колонки в пропорции 1:2:1 */
grid-template-columns: repeat(3, 1fr); /* 3 равные колонки */
grid-template-columns: minmax(100px, 1fr) 2fr; /* минимум 100px, максимум 1fr */
grid-template-columns: auto 1fr auto; /* автоматический размер по содержимому */

/* Определение строк */
grid-template-rows: 100px 200px; /* 2 строки с фиксированными размерами */
grid-template-rows: repeat(3, minmax(100px, auto)); /* минимум 100px, растягивается по содержимому */
grid-template-rows: 1fr 2fr; /* пропорции 1:2 */

/* Автоматические строки/колонки */
grid-auto-columns: 100px; /* для неявно созданных колонок */
grid-auto-rows: minmax(100px, auto); /* для неявно созданных строк */

/* Направление автоматического размещения */
grid-auto-flow: row; /* по строкам (по умолчанию) */
grid-auto-flow: column; /* по колонкам */
grid-auto-flow: dense; /* плотное заполнение */

/* Именованные линии */
grid-template-columns: [start] 1fr [middle] 2fr [end];
grid-template-rows: [header-start] 100px [header-end content-start] 1fr [content-end];

/* Именованные области */
grid-template-areas:
  "header header header"
  "sidebar content content"
  "footer footer footer";

/* Сокращение для всех template свойств */
grid-template: 
  [header-start] "header header header" 100px [header-end]
  [content-start] "sidebar content content" 1fr [content-end]
  [footer-start] "footer footer footer" 50px [footer-end]
  / 200px 1fr 1fr;

/* Интервалы между ячейками */
gap: 10px; /* одинаковый по обеим осям */
gap: 10px 20px; /* row-gap column-gap */
row-gap: 10px;
column-gap: 20px;

/* Выравнивание по горизонтали (колонки) */
justify-content: start; /* в начале */
justify-content: end; /* в конце */
justify-content: center; /* по центру */
justify-content: stretch; /* растягивание (по умолчанию) */
justify-content: space-between; /* равномерно, крайние колонки по краям */
justify-content: space-around; /* равномерно с отступами вокруг */
justify-content: space-evenly; /* равномерно с одинаковыми отступами */

/* Выравнивание по вертикали (строки) */
align-content: start;
align-content: end;
align-content: center;
align-content: stretch;
align-content: space-between;
align-content: space-around;
align-content: space-evenly;

/* Выравнивание элементов внутри ячеек по горизонтали */
justify-items: start;
justify-items: end;
justify-items: center;
justify-items: stretch; /* по умолчанию */

/* Выравнивание элементов внутри ячеек по вертикали */
align-items: start;
align-items: end;
align-items: center;
align-items: stretch; /* по умолчанию */
```

### Элементы Grid
```css
/* Размещение элемента по номерам линий */
grid-column-start: 1;
grid-column-end: 3;
grid-row-start: 2;
grid-row-end: 4;

/* Сокращение для column-start/end */
grid-column: 1 / 3; /* от линии 1 до линии 3 */
grid-column: 1 / span 2; /* от линии 1, охватывает 2 ячейки */
grid-column: 2 / -1; /* от линии 2 до последней линии */

/* Сокращение для row-start/end */
grid-row: 2 / 4;
grid-row: 2 / span 2;
grid-row: 1 / -1; /* на всю высоту */

/* Сокращение для column и row */
grid-area: 2 / 1 / 4 / 3; /* row-start / column-start / row-end / column-end */

/* Размещение в именованной области */
grid-area: header;

/* Индивидуальное выравнивание по горизонтали */
justify-self: start;
justify-self: end;
justify-self: center;
justify-self: stretch; /* по умолчанию */

/* Индивидуальное выравнивание по вертикали */
align-self: start;
align-self: end;
align-self: center;
align-self: stretch; /* по умолчанию */
```

### Практические примеры Grid
```css
/* Базовый макет страницы */
.container {
  display: grid;
  grid-template-areas:
    "header header header"
    "nav content sidebar"
    "footer footer footer";
  grid-template-columns: 200px 1fr 200px;
  grid-template-rows: auto 1fr auto;
  min-height: 100vh;
}
.header { grid-area: header; }
.nav { grid-area: nav; }
.content { grid-area: content; }
.sidebar { grid-area: sidebar; }
.footer { grid-area: footer; }

/* Адаптивная сетка */
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 20px;
}

/* Макет с перекрывающимися элементами */
.overlap-layout {
  display: grid;
  grid-template: repeat(4, 100px) / repeat(4, 100px);
}
.item1 {
  grid-area: 1 / 1 / 3 / 3;
  z-index: 1;
}
.item2 {
  grid-area: 2 / 2 / 4 / 4;
  z-index: 2;
}
```

## Трансформации и переходы

### Трансформации
```css
/* Базовые трансформации */
transform: translate(50px, 20px); /* сдвиг по x и y */
transform: translateX(50px); /* сдвиг по x */
transform: translateY(20px); /* сдвиг по y */
transform: translateZ(30px); /* сдвиг по z (требует perspective) */
transform: translate3d(50px, 20px, 30px); /* сдвиг по x, y и z */

transform: scale(1.5); /* масштаб по x и y */
transform: scaleX(1.5); /* масштаб по x */
transform: scaleY(0.8); /* масштаб по y */
transform: scaleZ(2); /* масштаб по z */
transform: scale3d(1.5, 0.8, 2); /* масштаб по x, y и z */

transform: rotate(45deg); /* поворот в плоскости */
transform: rotateX(45deg); /* поворот вокруг оси X */
transform: rotateY(45deg); /* поворот вокруг оси Y */
transform: rotateZ(45deg); /* поворот вокруг оси Z (эквивалент rotate) */
transform: rotate3d(1, 1, 1, 45deg); /* поворот вокруг произвольной оси */

transform: skew(10deg, 20deg); /* наклон по x и y */
transform: skewX(10deg); /* наклон по x */
transform: skewY(20deg); /* наклон по y */

/* Комбинирование трансформаций */
transform: translateX(50px) rotate(45deg) scale(1.5);

/* Точка трансформации */
transform-origin: center; /* по умолчанию */
transform-origin: top left;
transform-origin: 50px 30px;
transform-origin: 50% 50% 0;

/* 3D-эффекты */
perspective: 1000px; /* глубина перспективы (на родителе) */
perspective-origin: center; /* точка схода (на родителе) */
transform-style: preserve-3d; /* сохранение 3D для дочерних элементов */
backface-visibility: hidden; /* скрытие обратной стороны элемента */
```

### Переходы
```css
/* Базовый переход */
transition: property duration timing-function delay;

/* Свойство перехода */
transition-property: all; /* все анимируемые свойства */
transition-property: transform; /* только трансформация */
transition-property: opacity, transform; /* несколько свойств */
transition-property: none; /* без переходов */

/* Длительность перехода */
transition-duration: 0.3s;
transition-duration: 300ms;
transition-duration: 0.3s, 0.5s; /* разная длительность для разных свойств */

/* Функция времени */
transition-timing-function: ease; /* по умолчанию */
transition-timing-function: linear; /* линейно */
transition-timing-function: ease-in; /* ускорение */
transition-timing-function: ease-out; /* замедление */
transition-timing-function: ease; /* по умолчанию */
transition-timing-function: linear; /* линейно */
transition-timing-function: ease-in; /* ускорение */
transition-timing-function: ease-out; /* замедление */
transition-timing-function: ease-in-out; /* ускорение и замедление */
transition-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1); /* кривая Безье */
transition-timing-function: steps(5, end); /* пошаговый переход */

/* Задержка перехода */
transition-delay: 0s; /* без задержки (по умолчанию) */
transition-delay: 0.2s; /* задержка 0.2 секунды */
transition-delay: 0.2s, 0.5s; /* разные задержки для разных свойств */

/* Сокращенная запись */
transition: all 0.3s ease; /* свойство длительность функция */
transition: transform 0.3s ease-out 0.1s; /* с задержкой */
transition: opacity 0.3s, transform 0.5s; /* несколько переходов */

/* Пример использования */
button {
  background-color: blue;
  transition: background-color 0.3s ease;
}
button:hover {
  background-color: darkblue;
}
```

## Анимации

### Ключевые кадры
```css
/* Определение анимации */
@keyframes slide-in {
  /* начальное состояние */
  from {
    transform: translateX(-100%);
    opacity: 0;
  }
  /* конечное состояние */
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

/* Анимация с промежуточными кадрами */
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
  100% {
    transform: scale(1);
  }
}

/* Анимация с несколькими свойствами */
@keyframes fancy-move {
  0% {
    transform: translateX(0) rotate(0);
    background-color: red;
  }
  50% {
    transform: translateX(100px) rotate(180deg);
    background-color: blue;
  }
  100% {
    transform: translateX(0) rotate(360deg);
    background-color: green;
  }
}
```

### Применение анимаций
```css
/* Базовое применение */
.element {
  animation: name duration timing-function delay iteration-count direction fill-mode play-state;
}

/* Имя анимации */
animation-name: slide-in;
animation-name: none; /* без анимации */

/* Длительность */
animation-duration: 1s;
animation-duration: 300ms;

/* Функция времени */
animation-timing-function: ease;
animation-timing-function: linear;
animation-timing-function: ease-in;
animation-timing-function: ease-out;
animation-timing-function: ease-in-out;
animation-timing-function: cubic-bezier(0.25, 0.1, 0.25, 1);
animation-timing-function: steps(10, end);

/* Задержка */
animation-delay: 0s;
animation-delay: 0.5s;
animation-delay: -0.5s; /* начинается с середины */

/* Количество повторений */
animation-iteration-count: 1; /* один раз (по умолчанию) */
animation-iteration-count: 3; /* три раза */
animation-iteration-count: infinite; /* бесконечно */

/* Направление */
animation-direction: normal; /* от начала к концу (по умолчанию) */
animation-direction: reverse; /* от конца к началу */
animation-direction: alternate; /* туда и обратно */
animation-direction: alternate-reverse; /* обратно и туда */

/* Режим заполнения */
animation-fill-mode: none; /* без сохранения стилей (по умолчанию) */
animation-fill-mode: forwards; /* сохраняет конечное состояние */
animation-fill-mode: backwards; /* применяет начальное состояние до начала */
animation-fill-mode: both; /* сочетает forwards и backwards */

/* Состояние воспроизведения */
animation-play-state: running; /* воспроизведение (по умолчанию) */
animation-play-state: paused; /* пауза */

/* Сокращенная запись */
animation: slide-in 0.5s ease-out;
animation: pulse 2s ease-in-out infinite;
animation: fancy-move 3s linear 0.5s infinite alternate forwards;

/* Несколько анимаций */
animation: slide-in 0.5s ease-out, fade 1s linear;
```

### Управление анимациями с помощью JavaScript
```javascript
// Добавление/удаление класса с анимацией
element.classList.add('animated');
element.classList.remove('animated');

// Отслеживание событий анимации
element.addEventListener('animationstart', function() {
  console.log('Анимация началась');
});
element.addEventListener('animationend', function() {
  console.log('Анимация закончилась');
});
element.addEventListener('animationiteration', function() {
  console.log('Начался новый цикл анимации');
});
```

## Современные функции и переменные

### CSS-переменные (Custom Properties)
```css
/* Объявление глобальных переменных */
:root {
  --main-color: #3498db;
  --secondary-color: #2ecc71;
  --spacing-unit: 8px;
  --max-width: 1200px;
  --border-radius: 4px;
  --font-stack: 'Roboto', sans-serif;
}

/* Использование переменных */
.button {
  background-color: var(--main-color);
  padding: calc(var(--spacing-unit) * 2);
  border-radius: var(--border-radius);
  font-family: var(--font-stack);
}

/* Локальные переменные */
.card {
  --card-padding: 16px;
  padding: var(--card-padding);
}

/* Резервное значение */
color: var(--text-color, black);

/* Изменение переменных */
.dark-theme {
  --main-color: #2980b9;
  --text-color: white;
}

/* Динамическое изменение с JavaScript */
// element.style.setProperty('--main-color', '#ff0000');
```

### Функции расчёта
```css
/* calc() - математические вычисления */
width: calc(100% - 40px);
margin: calc(var(--spacing) * 2);
font-size: calc(1rem + 1vw);

/* min() - минимальное из значений */
width: min(800px, 100%); /* адаптивная ширина с максимумом */
font-size: min(5vw, 3rem); /* адаптивный текст с максимумом */

/* max() - максимальное из значений */
width: max(400px, 50%); /* адаптивная ширина с минимумом */
padding: max(8px, 1vw); /* адаптивные отступы с минимумом */

/* clamp() - ограничение значения между min и max */
font-size: clamp(1rem, 5vw, 3rem); /* адаптивный текст с ограничениями */
width: clamp(300px, 50%, 800px); /* адаптивная ширина с ограничениями */
```

### Функции для цветов
```css
/* rgb() и rgba() */
color: rgb(255, 0, 0); /* красный */
color: rgba(255, 0, 0, 0.5); /* полупрозрачный красный */
/* Современный синтаксис с пробелами */
color: rgb(255 0 0 / 50%);

/* hsl() и hsla() */
color: hsl(0, 100%, 50%); /* красный */
color: hsla(0, 100%, 50%, 0.5); /* полупрозрачный красный */
/* Современный синтаксис с пробелами */
color: hsl(0 100% 50% / 50%);

/* hwb() - оттенок, белизна, чернота */
color: hwb(0 0% 0%); /* красный */
color: hwb(0 20% 0%); /* светло-красный */
color: hwb(0 0% 20%); /* темно-красный */
color: hwb(0 20% 20%); /* приглушенный красный */
color: hwb(0 0% 0% / 50%); /* полупрозрачный красный */

/* lab() - перцептивно-равномерное цветовое пространство */
color: lab(50% 40 20);
color: lab(50% 40 20 / 0.5);

/* lch() - перцептивно-равномерное с полярными координатами */
color: lch(50% 40 20);
color: lch(50% 40 20 / 0.5);

/* color-mix() - смешивание цветов */
color: color-mix(in srgb, red, blue); /* по умолчанию 50/50 */
color: color-mix(in srgb, red 30%, blue 70%);
color: color-mix(in hsl, red, blue);
color: color-mix(in lch, red, blue);

/* color-contrast() - выбор цвета с лучшим контрастом */
color: color-contrast(var(--background-color) vs black, white, #aaa);

/* color() - определение цвета в произвольном цветовом пространстве */
color: color(display-p3 1 0 0);
color: color(display-p3 1 0 0 / 0.5);
```

## Адаптивный дизайн

### Медиа-запросы
```css
/* По ширине экрана */
@media screen and (max-width: 768px) {
  /* Стили для экранов шириной до 768px */
}

@media screen and (min-width: 769px) and (max-width: 1024px) {
  /* Стили для экранов от 769px до 1024px */
}

@media screen and (min-width: 1025px) {
  /* Стили для экранов от 1025px и шире */
}

/* По ориентации устройства */
@media (orientation: portrait) {
  /* Стили для портретной ориентации */
}

@media (orientation: landscape) {
  /* Стили для альбомной ориентации */
}

/* По типу устройства */
@media screen {
  /* Стили для экранов */
}

@media print {
  /* Стили для печати */
}

@media speech {
  /* Стили для устройств чтения с экрана */
}

/* По соотношению сторон */
@media (aspect-ratio: 16/9) {
  /* Стили для экранов с соотношением 16:9 */
}

@media (min-aspect-ratio: 4/3) {
  /* Стили для экранов с соотношением от 4:3 и шире */
}

/* По разрешению экрана */
@media (resolution: 2dppx) {
  /* Стили для экранов с плотностью пикселей 2 и выше (Retina) */
}

/* По возможностям устройства */
@media (hover: hover) {
  /* Стили для устройств, поддерживающих наведение */
}

@media (hover: none) {
  /* Стили для устройств без поддержки наведения (тачскрины) */
}

@media (pointer: fine) {
  /* Стили для устройств с точным указателем (мышь) */
}

@media (pointer: coarse) {
  /* Стили для устройств с грубым указателем (палец) */
}

@media (prefers-reduced-motion: reduce) {
  /* Стили для пользователей, предпочитающих меньше анимации */
  * {
    animation: none !important;
    transition: none !important;
  }
}

@media (prefers-color-scheme: dark) {
  /* Стили для тёмной темы */
}

@media (prefers-color-scheme: light) {
  /* Стили для светлой темы */
}

/* Комбинирование условий */
@media screen and (min-width: 768px) and (orientation: landscape) {
  /* Стили для экранов от 768px в альбомной ориентации */
}

/* Логические операторы */
@media (min-width: 768px) and (max-width: 1024px) {
  /* И - оба условия должны выполняться */
}

@media (max-width: 600px), (min-width: 1200px) {
  /* ИЛИ - должно выполняться хотя бы одно условие */
}

@media not (color) {
  /* НЕ - отрицание условия */
}
```

### Адаптивные единицы измерения
```css
/* Относительные единицы */
font-size: 1em; /* относительно размера шрифта родителя */
line-height: 1.5; /* множитель от размера шрифта элемента */
margin: 2rem; /* относительно размера шрифта корневого элемента */
padding: 1.5em; /* относительно размера шрифта самого элемента */

/* Единицы области просмотра */
width: 50vw; /* 50% ширины viewport */
height: 100vh; /* 100% высоты viewport */
font-size: calc(16px + 1vw); /* адаптивный размер шрифта */
padding: 5vmin; /* 5% от минимального измерения viewport */
margin: 3vmax; /* 3% от максимального измерения viewport */

/* Современные единицы viewport */
height: 100dvh; /* динамическая высота viewport (учитывает UI браузера) */
height: 100lvh; /* наименьшая высота viewport */
height: 100svh; /* наибольшая высота viewport */
width: 100dvw; /* динамическая ширина viewport */

/* Единицы шрифта */
font-size: 2ex; /* относительно высоты строчной буквы 'x' */
width: 10ch; /* относительно ширины символа '0' */
```

### Адаптивные изображения
```css
/* Базовая адаптивность */
img {
  max-width: 100%;
  height: auto;
}

/* Современный тег picture */
<picture>
  <source srcset="image-large.jpg" media="(min-width: 1200px)">
  <source srcset="image-medium.jpg" media="(min-width: 768px)">
  <img src="image-small.jpg" alt="Описание изображения">
</picture>

/* Атрибут srcset для разных разрешений */
<img 
  src="image-small.jpg" 
  srcset="image-small.jpg 1x, image-large.jpg 2x" 
  alt="Описание изображения">

/* Атрибут srcset с размерами */
<img 
  src="image-small.jpg" 
  srcset="image-small.jpg 400w, image-medium.jpg 800w, image-large.jpg 1200w" 
  sizes="(max-width: 600px) 100vw, (max-width: 1200px) 50vw, 33vw" 
  alt="Описание изображения">

/* Адаптивный фон */
.hero {
  background-image: url('small.jpg');
}
@media (min-width: 768px) {
  .hero {
    background-image: url('medium.jpg');
  }
}
@media (min-width: 1200px) {
  .hero {
    background-image: url('large.jpg');
  }
}

/* Современный image-set() для фоновых изображений */
.hero {
  background-image: image-set(
    url("image-small.jpg") 1x,
    url("image-large.jpg") 2x
  );
}
```

## CSS Modules и методологии

### BEM (Block Element Modifier)
```css
/* Блок */
.button {
  padding: 10px 15px;
  background-color: blue;
  color: white;
}

/* Элемент (часть блока) */
.button__icon {
  margin-right: 5px;
}

.button__text {
  font-weight: bold;
}

/* Модификатор (вариация блока) */
.button--large {
  padding: 15px 25px;
  font-size: 1.2em;
}

.button--success {
  background-color: green;
}

.button--danger {
  background-color: red;
}

/* Использование в HTML */
<button class="button button--large button--success">
  <span class="button__icon">✓</span>
  <span class="button__text">Подтвердить</span>
</button>
```

### SMACSS (Scalable and Modular Architecture for CSS)
```css
/* Базовые стили */
body, h1, p {
  margin: 0;
  padding: 0;
}

/* Стили макета */
.l-header {
  width: 100%;
}

.l-sidebar {
  float: left;
  width: 25%;
}

.l-content {
  float: right;
  width: 75%;
}

/* Модули */
.nav { /* ... */ }
.card { /* ... */ }

/* Состояния */
.is-active { /* ... */ }
.is-hidden { /* ... */ }

/* Темы */
.theme-dark { /* ... */ }
.theme-light { /* ... */ }
```

### OOCSS (Object Oriented CSS)
```css
/* Структура отделена от оформления */

/* Структура */
.btn {
  display: inline-block;
  padding: 5px 10px;
  border-radius: 3px;
}

/* Оформление */
.btn-primary {
  background-color: blue;
  color: white;
}

.btn-secondary {
  background-color: gray;
  color: black;
}

/* Размеры */
.btn-large {
  padding: 10px 20px;
  font-size: 1.2em;
}

/* Использование в HTML */
<button class="btn btn-primary btn-large">Кнопка</button>
```

### Atomic CSS
```css
/* Утилитарные классы */
.m-0 { margin: 0; }
.mt-10 { margin-top: 10px; }
.p-20 { padding: 20px; }
.flex { display: flex; }
.justify-center { justify-content: center; }
.items-center { align-items: center; }
.text-lg { font-size: 1.2em; }
.font-bold { font-weight: bold; }
.bg-blue { background-color: blue; }
.text-white { color: white; }
.rounded { border-radius: 5px; }

/* Использование в HTML */
<div class="flex justify-center items-center p-20 bg-blue text-white rounded">
  <span class="text-lg font-bold">Контент</span>
</div>
```

## Новые CSS-свойства

### Aspect Ratio
```css
/* Поддержание соотношения сторон */
.video-container {
  aspect-ratio: 16 / 9;
  width: 100%;
}

.square {
  aspect-ratio: 1 / 1;
  width: 50%;
}

.card {
  aspect-ratio: auto; /* по умолчанию */
}
```

### Scroll Snap
```css
/* Контейнер прокрутки */
.scroll-container {
  scroll-snap-type: x mandatory; /* обязательная привязка по горизонтали */
  scroll-snap-type: y proximity; /* необязательная привязка по вертикали */
  scroll-snap-type: both mandatory; /* обязательная привязка по обеим осям */
  scroll-behavior: smooth; /* плавная прокрутка */
  overflow: auto;
}

/* Элементы для привязки */
.scroll-item {
  scroll-snap-align: start; /* привязка к началу */
  scroll-snap-align: center; /* привязка к центру */
  scroll-snap-align: end; /* привязка к концу */
  
  scroll-snap-stop: always; /* всегда останавливаться на этом элементе */
  scroll-snap-stop: normal; /* по умолчанию */
}

/* Отступы привязки */
.scroll-container {
  scroll-padding: 20px; /* отступ от края контейнера */
  scroll-padding-top: 50px;
}

.scroll-item {
  scroll-margin: 10px; /* отступ элемента */
  scroll-margin-left: 20px;
}
```

### Backdrop Filter
```css
/* Эффекты для фона за элементом */
.frosted-glass {
  background-color: rgba(255, 255, 255, 0.3);
  backdrop-filter: blur(10px); /* размытие фона */
}

.dark-overlay {
  background-color: rgba(0, 0, 0, 0.3);
  backdrop-filter: brightness(80%); /* затемнение фона */
}

/* Комбинирование эффектов */
.fancy-overlay {
  backdrop-filter: blur(5px) brightness(90%) contrast(110%) saturate(130%);
}
```

### Фильтры
```css
/* Базовые фильтры */
.image {
  filter: blur(5px); /* размытие */
  filter: brightness(150%); /* яркость */
  filter: contrast(200%); /* контраст */
  filter: grayscale(100%); /* оттенки серого */
  filter: hue-rotate(90deg); /* поворот оттенка */
  filter: invert(100%); /* инверсия */
  filter: opacity(50%); /* прозрачность */
  filter: saturate(200%); /* насыщенность */
  filter: sepia(100%); /* сепия */
  filter: drop-shadow(5px 5px 10px black); /* тень (не как box-shadow) */
}

/* Комбинирование фильтров */
.vintage-effect {
  filter: sepia(50%) contrast(120%) brightness(90%) saturate(85%);
}
```

### Маски
```css
/* Базовая маска с изображением */
.masked-element {
  mask-image: url('mask.png');
  mask-size: cover;
  mask-repeat: no-repeat;
  mask-position: center;
}

/* Маска с градиентом */
.fade-out {
  mask-image: linear-gradient(to right, black 50%, transparent 100%);
}

/* Комбинирование масок */
.complex-mask {
  mask-image: url('mask1.png'), linear-gradient(to bottom, black, transparent);
  mask-composite: intersect; /* пересечение масок */
}

/* Режимы композиции */
mask-composite: add; /* сложение */
mask-composite: subtract; /* вычитание */
mask-composite: intersect; /* пересечение */
mask-composite: exclude; /* исключение */
```

### Обрезка и фигуры
```css
/* Обрезка контента */
.clipped {
  clip-path: circle(50% at center); /* круг */
  clip-path: ellipse(25% 40% at 50% 50%); /* эллипс */
  clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%); /* многоугольник */
  clip-path: inset(10% 20% 10% 20% round 10px); /* прямоугольник со скругленными углами */
}

/* Обтекание текста вокруг фигуры */
.shaped {
  shape-outside: circle(50%);
  shape-outside: ellipse(40% 50%);
  shape-outside: polygon(0 0, 100% 0, 100% 100%, 0 100%);
  shape-outside: url('shape.png');
  shape-margin: 20px; /* отступ от фигуры */
}
```

## Контейнерные запросы

### Определение контейнеров
```css
/* Объявление контейнера */
.container {
  container-type: inline-size; /* размер только по горизонтали */
  container-type: size; /* размер по обеим осям */
  container-type: normal; /* не является контейнером (по умолчанию) */
}

/* Именование контейнера */
.layout {
  container-type: size;
  container-name: layout;
}

/* Сокращенная запись */
.sidebar {
  container: sidebar inline-size; /* имя и тип */
}
```

### Контейнерные медиа-запросы
```css
/* Запрос по ширине контейнера */
@container (min-width: 400px) {
  .card {
    display: flex;
  }
}

/* Запрос по высоте контейнера */
@container (min-height: 300px) {
  .card-content {
    max-height: 250px;
  }
}

/* Запрос к именованному контейнеру */
@container sidebar (max-width: 300px) {
  .widget {
    flex-direction: column;
  }
}

/* Комбинирование условий */
@container (min-width: 400px) and (max-width: 600px) {
  .card-title {
    font-size: 1.2rem;
  }
}
```

## Логические свойства

### Направление потока
```css
/* Направление письма */
writing-mode: horizontal-tb; /* сверху вниз, слева направо (по умолчанию) */
writing-mode: vertical-rl; /* справа налево, сверху вниз */
writing-mode: vertical-lr; /* слева направо, сверху вниз */

/* Направление текста */
direction: ltr; /* слева направо (по умолчанию) */
direction: rtl; /* справа налево */
```

### Логические размеры
```css
/* Ширина и высота */
width: 100px;  /* физическое свойство */
height: 200px; /* физическое свойство */

inline-size: 100px; /* логическая ширина (по направлению текста) */
block-size: 200px;  /* логическая высота (перпендикулярно тексту) */

/* Минимальные и максимальные размеры */
min-inline-size: 50px;
max-inline-size: 300px;
min-block-size: 100px;
max-block-size: 500px;
```

### Логические отступы
```css
/* Внутренние отступы */
padding-top: 10px;     /* физическое свойство */
padding-right: 20px;   /* физическое свойство */
padding-bottom: 10px;  /* физическое свойство */
padding-left: 20px;    /* физическое свойство */

padding-block-start: 10px;  /* верх для горизонтального текста */
padding-inline-end: 20px;   /* право для LTR, лево для RTL */
padding-block-end: 10px;    /* низ для горизонтального текста */
padding-inline-start: 20px; /* лево для LTR, право для RTL */

/* Сокращения */
padding-block: 10px;  /* верх и низ */
padding-inline: 20px; /* лево и право */

/* Внешние отступы */
margin-block-start: 10px;
margin-inline-end: 20px;
margin-block-end: 10px;
margin-inline-start: 20px;

margin-block: 10px;
margin-inline: 20px;
```

### Логические границы
```css
/* Границы */
border-top: 1px solid black;    /* физическое свойство */
border-right: 1px solid black;  /* физическое свойство */
border-bottom: 1px solid black; /* физическое свойство */
border-left: 1px solid black;   /* физическое свойство */

border-block-start: 1px solid black;  /* верх для горизонтального текста */
border-inline-end: 1px solid black;   /* право для LTR, лево для RTL */
border-block-end: 1px solid black;    /* низ для горизонтального текста */
border-inline-start: 1px solid black; /* лево для LTR, право для RTL */

/* Сокращения */
border-block: 1px solid black;
border-inline: 1px solid black;

/* Радиус границы */
border-top-left-radius: 5px;     /* физическое свойство */
border-top-right-radius: 5px;    /* физическое свойство */
border-bottom-right-radius: 5px; /* физическое свойство */
border-bottom-left-radius: 5px;  /* физическое свойство */

border-start-start-radius: 5px; /* верхний левый для LTR, верхний правый для RTL */
border-start-end-radius: 5px;   /* верхний правый для LTR, верхний левый для RTL */
border-end-end-radius: 5px;     /* нижний правый для LTR, нижний левый для RTL */
border-end-start-radius: 5px;   /* нижний левый для LTR, нижний правый для RTL */
```

### Логическое позиционирование
```css
/* Физические свойства */
top: 10px;
right: 20px;
bottom: 10px;
left: 20px;

/* Логические свойства */
inset-block-start: 10px;  /* верх для горизонтального текста */
inset-inline-end: 20px;   /* право для LTR, лево для RTL */
inset-block-end: 10px;    /* низ для горизонтального текста */
inset-inline-start: 20px; /* лево для LTR, право для RTL */

/* Сокращения */
inset-block: 10px;  /* верх и низ */
inset-inline: 20px; /* лево и право */
inset: 10px 20px;   /* block inline */
inset: 10px;        /* со всех сторон */
```

### Логическое выравнивание текста
```css
/* Физическое свойство */
text-align: left;
text-align: right;

/* Логическое свойство */
text-align: start; /* лево для LTR, право для RTL */
text-align: end;   /* право для LTR, лево для RTL */
```

## Субгриды

### Основы субгридов
```css
/* Родительская сетка */
.parent-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 20px;
}

/* Дочерний элемент как субгрид */
.child-grid {
  grid-column: 2 / 12; /* занимает с 2 по 12 колонки родителя */
  
  display: grid;
  grid-template-columns: subgrid; /* использует колонки родителя */
  grid-template-rows: subgrid; /* использует строки родителя */
}

/* Только колонки как субгрид */
.columns-subgrid {
  grid-column: 3 / 9;
  display: grid;
  grid-template-columns: subgrid;
  grid-template-rows: repeat(3, 100px); /* собственные строки */
}

/* Только строки как субгрид */
.rows-subgrid {
  grid-row: 2 / 5;
  display: grid;
  grid-template-rows: subgrid;
  grid-template-columns: repeat(3, 1fr); /* собственные колонки */
}
```

### Практические примеры субгридов
```css
/* Форма с метками и полями ввода */
.form {
  display: grid;
  grid-template-columns: max-content 1fr;
  gap: 10px;
}

.fieldset {
  grid-column: 1 / -1; /* занимает все колонки */
  
  display: grid;
  grid-template-columns: subgrid;
  padding: 20px;
  border: 1px solid #ccc;
}

/* Карточки с заголовками на одной линии */
.cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

.card {
  display: grid;
  grid-template-rows: auto 1fr auto;
}

.cards-aligned {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: auto 1fr auto;
  gap: 20px;
}

.card-aligned {
  display: grid;
  grid-template-rows: subgrid;
  grid-row: span 3;
}
```

## Слои каскада

### Определение слоев
```css
/* Объявление слоя */
@layer base;

/* Объявление нескольких слоев */
@layer base, components, utilities;

/* Добавление стилей в слой */
@layer base {
  body {
    font-family: sans-serif;
    margin: 0;
    padding: 0;
  }
  
  h1, h2, h3 {
    margin-top: 0;
  }
}

/* Добавление в существующий слой */
@layer components {
  .button {
    padding: 0.5em 1em;
    border-radius: 4px;
  }
}

@layer components {
  .card {
    border: 1px solid #ddd;
    border-radius: 4px;
  }
}

/* Вложенные слои */
@layer framework {
  @layer layout {
    /* стили для layout */
  }
  
  @layer components {
    /* стили для компонентов */
  }
}

/* Использование вложенных слоев */
@layer framework.components {
  /* дополнительные стили */
}
```

### Порядок каскада
```css
/* Порядок слоев (от низшего приоритета к высшему) */
@layer base, components, utilities;

/* Стили вне слоев имеют более высокий приоритет */
.special-case {
  color: red !important; /* наивысший приоритет */
}

/* Анонимный слой (имеет приоритет выше, чем именованные слои) */
@layer {
  .semi-important {
    color: blue;
  }
}
```

### Практические примеры слоев
```css
/* Подход к организации стилей */
@layer reset, base, components, utilities;

@layer reset {
  /* Сброс стилей браузера */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
}

@layer base {
  /* Базовые стили */
  body {
    font-family: 'Roboto', sans-serif;
    line-height: 1.5;
    color: #333;
  }
  
  h1 {
    font-size: 2rem;
    margin-bottom: 1rem;
  }
}

@layer components {
  /* Компоненты интерфейса */
  .button {
    display: inline-block;
    padding: 0.5rem 1rem;
    background-color: #0066cc;
    color: white;
    border-radius: 4px;
  }
  
  .card {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 1rem;
  }
}

@layer utilities {
  /* Утилитарные классы */
  .mt-1 { margin-top: 0.25rem; }
  .mt-2 { margin-top: 0.5rem; }
  .mt-4 { margin-top: 1rem; }
  
  .text-center { text-align: center; }
  .text-bold { font-weight: bold; }
}

/* Переопределение стилей библиотеки */
@import url('third-party-library.css') layer(vendor);

@layer vendor, custom;

@layer custom {
  /* Эти стили переопределят стили из vendor, даже если они менее специфичны */
  .vendor-button {
    background-color: #ff0000;
  }
}
```

## Дополнительные современные возможности

### Свойство content-visibility
```css
/* Оптимизация рендеринга */
.section {
  content-visibility: auto; /* автоматически пропускает рендеринг вне экрана */
  contain-intrinsic-size: 500px; /* примерный размер для резервирования места */
}

.offscreen {
  content-visibility: hidden; /* скрывает содержимое, но сохраняет элемент в DOM */
}
```

### Свойство overscroll-behavior
```css
/* Управление поведением при прокрутке за пределы */
.modal {
  overscroll-behavior: contain; /* предотвращает прокрутку родителя */
}

body {
  overscroll-behavior: none; /* отключает эффект "отскока" на мобильных */
}

.scroll-container {
  overscroll-behavior-x: auto; /* по умолчанию */
  overscroll-behavior-y: contain;
}
```

### Свойство accent-color
```css
/* Цвет акцента для элементов формы */
:root {
  accent-color: #0066cc; /* глобальный цвет акцента */
}

input[type="checkbox"] {
  accent-color: green; /* зеленые чекбоксы */
}

input[type="radio"] {
  accent-color: rebeccapurple; /* фиолетовые радио-кнопки */
}

progress {
  accent-color: orange; /* оранжевый индикатор прогресса */
}
```

### Функция has() (родительский селектор)
```css
/* Стилизация родителя на основе дочерних элементов */
/* Карточка, содержащая изображение */
.card:has(img) {
  padding-top: 0;
}

/* Форма с заполненным полем */
form:has(input:valid) {
  border-color: green;
}

/* Родитель с наведением на дочерний элемент */
.gallery:has(.image:hover) {
  background-color: #f0f0f0;
}

/* Абзац с большим количеством текста */
p:has(+ p) {
  margin-bottom: 1em;
}

/* Сложные условия */
.container:has(.item:hover, .item:focus) {
  outline: 2px solid blue;
}
```

### Селектор :focus-visible
```css
/* Улучшенный фокус */
button:focus {
  /* Применяется при любом фокусе */
  outline: 2px solid blue;
}

button:focus-visible {
  /* Применяется только при фокусе с клавиатуры */
  outline: 2px solid blue;
  box-shadow: 0 0 0 4px rgba(0, 102, 204, 0.3);
}

button:focus:not(:focus-visible) {
  /* Убирает контур при клике мышью */
  outline: none;
}
```

### Свойство font-variant
```css
/* Варианты отображения шрифта */
.small-caps {
  font-variant: small-caps; /* малые прописные */
}

.numeric {
  font-variant-numeric: oldstyle-nums tabular-nums; /* старый стиль цифр, моноширинные */
}

.ligatures {
  font-variant-ligatures: common-ligatures discretionary-ligatures;
}

/* Все варианты */
.advanced-typography {
  font-variant: small-caps oldstyle-nums common-ligatures discretionary-ligatures;
}
```

### Свойство gap для Flexbox
```css
/* Интервалы между flex-элементами */
.flex-container {
  display: flex;
  gap: 20px; /* равные интервалы между всеми элементами */
}

.flex-container-2d {
  display: flex;
  flex-wrap: wrap;
  gap: 20px 10px; /* row-gap column-gap */
  row-gap: 20px;
  column-gap: 10px;
}
```

### Свойство place-items и place-content
```css
/* Сокращение для выравнивания в Grid и Flexbox */
.container {
  /* Выравнивание элементов */
  place-items: center; /* align-items: center; justify-items: center; */
  place-items: start end; /* align-items: start; justify-items: end; */
  
  /* Выравнивание контента */
  place-content: center; /* align-content: center; justify-content: center; */
  place-content: space-between end; /* align-content: space-between; justify-content: end; */
}
```

### Свойство text-underline-offset и text-decoration-thickness
```css
/* Настройка подчеркивания */
.custom-underline {
  text-decoration: underline;
  text-decoration-color: red;
  text-decoration-thickness: 2px; /* толщина линии */
  text-underline-offset: 5px; /* отступ от текста */
  text-decoration-skip-ink: auto; /* обходит нижние выносные элементы букв */
}
```

### Современные псевдоклассы
```css
/* Проверка пустоты с учетом пробелов */
:blank {
  display: none;
}

/* Целевой элемент (при клике на якорную ссылку) */
:target {
  background-color: yellow;
}

/* Текущий элемент в навигации */
:current {
  font-weight: bold;
}

/* Прошлые и будущие элементы (например, в презентации) */
:past {
  opacity: 0.5;
}
:future {
  opacity: 0.5;
}
```

### Свойство scroll-behavior и scroll-padding
```css
/* Плавная прокрутка */
html {
  scroll-behavior: smooth;
}

/* Отступы при прокрутке к якорю */
.container {
  scroll-padding-top: 100px; /* учитывает фиксированный заголовок */
  scroll-padding: 100px 0 0 0;
}
```

### Свойство user-select
```css
/* Управление выделением текста */
.no-select {
  user-select: none; /* запрет выделения */
}

.select-all {
  user-select: all; /* выделение всего содержимого при клике */
}

.select-text {
  user-select: text; /* стандартное выделение текста (по умолчанию) */
}

.select-auto {
  user-select: auto; /* браузер определяет поведение */
}
```

### Свойство pointer-events
```css
/* Управление событиями указателя */
.disabled {
  pointer-events: none; /* элемент не реагирует на клики и наведение */
}

.clickable-overlay {
  pointer-events: auto; /* элемент реагирует на события (по умолчанию) */
}
```

### Свойство will-change
```css
/* Оптимизация производительности */
.animated {
  will-change: transform; /* подготовка браузера к анимации трансформации */
}

.complex {
  will-change: transform, opacity; /* несколько свойств */
}
```

### Свойство scroll-timeline (экспериментальное)
```css
/* Анимация на основе прокрутки */
@scroll-timeline scroll-progress {
  source: selector(body);
  orientation: vertical;
  scroll-offsets: 0%, 100%;
}

.progress-bar {
  animation: grow 1s linear;
  animation-timeline: scroll-progress;
}

@keyframes grow {
  from { width: 0%; }
  to { width: 100%; }
}
```

### Свойство view-timeline (экспериментальное)
```css
/* Анимация при появлении в области просмотра */
@keyframes fade-in {
  from { opacity: 0; }
  to { opacity: 1; }
}

.reveal {
  view-timeline: --reveal-timeline block;
  animation: fade-in linear;
  animation-timeline: --reveal-timeline;
}
```
