# Knapsack

You are developing an application - the companion of a seasoned hiker. 
Вы разрабатываете приложение - спутник бывалого путешественника.

It helps you choose the right food and drink for the trip. To go forward, the hiker needs to eat and drink.
As soon as his body runs out of food or water, the tourist stops to eat, drink, or both at once.
Это поможет вам выбрать правильную еду и напитки для поездки. Чтобы идти вперед, путешественнику нужно есть и пить.
Как только в его организме заканчивается еда или вода, турист прекращает есть, пить или и то, и другое сразу.

When going on a hike, a tourist chooses what food and drink to take with him.
Отправляясь в поход, турист выбирает, какую еду и питье взять с собой.
He has **n** different products at his disposal, which weigh `fw1 ... fwi ... fwn` grams and gives the body sufficient nutrients to travel `fd1 ... fdi ... fdn` kilometers. Also, the hiker can choose any of **m** drinks that weigh `dw1 ... dwi ... dwm` grams and give the body sufficient fluid to travel `dd1 ... ddi ... ddm` kilometres.
В его распоряжении ** n ** различных продуктов, которые весят «fw1 ... fwi ... fwn» граммов и дают организму достаточно питательных веществ для проезда «fd1 ... fdi ... fdn» километров. Кроме того, путешественник может выбрать любой из ** m ** напитков, который весит dw1 ... dwi ... dwm` граммов и дает организму достаточно жидкости для проезда dd1 ... ddi ... ddm километров.

In total, the hiker can carry no more than **k** grams of cargo. He wants to get away **as far as possible**. What is the **maximum** number of kilometres a hiker can cover if he packs his backpack **optimally**?
Всего турист может перевезти не более ** k ** граммов груза. Он хочет уйти ** как можно дальше **. Какое ** максимальное ** количество километров может преодолеть турист, если он ** упаковывает рюкзак оптимальным образом **?

There are no other weights in the backpack. 
Других грузов в рюкзаке нет.

## Constraints
```
1 <= n, m <= 100
1 <= fw,fd,dw,dd <= 100
maxWeight < 2500
Timelimit = 3 seconds
```
## Example 1: 
```swift 
public typealias Supply = (weight: Int, value: Int) 

let maxWeight = 123
let foods: [Supply] = [(46, 71), (37, 41), (1, 2)]
let drinks: [Supply] = [(79, 65), (84, 23)]

// foods pack - (37, 41) and (1, 2) => allows travel 43 km,
// drinks pack - (79, 65) => allows travel 65 km => min(43, 65) = 43

maxKilometres = 43
```

## Example 2: 
```swift 
let maxWeight = 120
let foods: [Supply] = [
    (14, 53), // +
    (84, 62),
    (64, 44),
    (4, 21), // +
    (86, 37),
    (95, 48),
    (28, 61), // +
    (16, 43),
    (96, 67),
    (46, 99), // +
    (59, 42),
    (71, 30),
    (38, 18),
] 
let drinks: [Supply] = [
    (14, 95), // +
    (81, 60),
    (9, 74), // +
    (5, 51), // +
    (73, 38),
    (79, 73),
    (65, 53),
    (17, 92),
    (15, 97),
    (76, 45),
    (29, 2),
    (16, 94),
    (40, 48),
    (36, 77),
    (10, 28),
]

// foods pack - (14, 53), (4, 21), (28, 61) and (46, 99)
=> allows travel 53 + 21 + 61 + 99 = 234 km (total weight 14 + 4 + 28 + 46 = 92)
// drinks pack - (14, 95), (9, 74), (5, 51) => allows travel 95 + 74 + 51 = 220 km (total weight 14 + 9 + 5 = 28) 
=> min(234, 220) = 220

maxKilometres = 220
```
