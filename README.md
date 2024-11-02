# WishMaker

- [WishMaker](#wishmaker)
  - [Об архитектуре](#об-архитектуре)
  - [Ответы на вопросы](#ответы-на-вопросы)
    - [1. **What issues prevent us from using storyboards in real projects?**](#1-what-issues-prevent-us-from-using-storyboards-in-real-projects)
    - [2. **What does the code on lines 25 and 29 do?**](#2-what-does-the-code-on-lines-25-and-29-do)
    - [3. **What is a safe area layout guide?**](#3-what-is-a-safe-area-layout-guide)
    - [4. **What is \[weak self\] on line 23 and why it is important?**](#4-what-is-weak-self-on-line-23-and-why-it-is-important)
    - [5. **What does clipsToBounds mean?**](#5-what-does-clipstobounds-mean)
    - [6. **What is the valueChanged type? What is Void and what is Double?**](#6-what-is-the-valuechanged-type-what-is-void-and-what-is-double)


## Об архитектуре

В этом проекте я постарался применить [архитектуру SVIP](https://habr.com/ru/companies/wildberries/articles/798275/). Было выделено 2 «бизнес-процесса»:

1. смена цвета при помощи slider'ов
2. смена цвета при помощи рандома

Также была реализована возможность скрыть slider'ы, но в отдельный бизнес-процесс это действие вынесено не было.

## Ответы на вопросы

### 1. **What issues prevent us from using storyboards in real projects?**

Одна из основных проблем при использовании storyboard'ов – неудобство их использования при командной разработке. Сам storyboard представляет из себя XML файл, что делает его нечитаемым в "сыром виде". Более того, при возникновении merge конфликтов разобраться в том, что вообще происходит и как разрешить возникший конфликт, практически невозможно.

Стоит также упомянуть огромное количество багов, возникающих в Xcode при использовании storyboard'ов. 

### 2. **What does the code on lines 25 and 29 do?**

```swift
title.translatesAutoresizingMaskIntoConstraints = false
```

Эта строка кода отключает автоматическое создание констрейнтов. Мы обязаны ее использовать, так как сами задаем констрейнты, которые будут конфликтовать с автоматически созданными.

```swift
view.addSubview(title)
```

Эта строка кода делает view `title` подview основного `view`. Без этой строки мы никогда не сможем увидеть наш `title`.

### 3. **What is a safe area layout guide?**

Это объект `UILayoutGuide`, характеризующий участок `view`, свободный от навигационной панели, "челки" и всякого другого.

Вот, что говорит об этом официальная документация:

> When the view is visible onscreen, this guide reflects the portion of the view that is not covered by navigation bars, tab bars, toolbars, and other ancestor views. If the view is not currently installed in a view hierarchy, or is not yet visible onscreen, the layout guide edges are equal to the edges of the view.

### 4. **What is [weak self] on line 23 and why it is important?**

Прочитал статью [отсюда](https://www.avanderlee.com/swift/weak-self/).

`weak self` помогает избавиться нам от *retain* циклов (ситуаций, когда один два объекта ссылаются друг на друга при помощи сильных ссылок). В таких циклов не происходит уничтожение объектов, так как не происходит обнуление счетчика ссылок. В этот момент и приходят на помощь слабые `weak` ссылки.

### 5. **What does clipsToBounds mean?**

`clipsToBounds` – это свойство `UIView`, позволяющее (при значениии`true`) `subview` *be clipped to the bounds of the view*.

### 6. **What is the valueChanged type? What is Void and what is Double?**

`valueChanged` – это замыкание типа `(Double) -> Void`.  Здесь `Double` – это значение аргумента функции, а `Void` возвращаемый тип (функция ничего не возвращает).