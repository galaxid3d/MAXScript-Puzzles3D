# MAXScript-Puzzles3D
Script "Puzzles3D" start create by 07.2017

Scripts purpose: generates N x M puzzles.

When creating 3D puzzles, you can put any picture on them and render it or print it on a 3D printer.

When creating 2D puzzles, you can export them as a shape file for Adobe Illustrator and use the vector form.

#### Script features:
*   Generate both 2D puzzles and 3D puzzles.
*   You can control the seeds of the puzzles themselves, offsets, and columns.
*   You can control the shape type (how round or square) of the puzzles.
*   You can create N x M not only in the form of a rectangle, but also in the form of endless puzzles - you can copy these N x M puzzles as a whole block and place them next to the current ones (right/left/top/bottom) and they will fit together.
*   You can control offsets in (you can select only individual points, as well as a mode where the “+” or “-” of the offset will depend on whether there is convexity or concavity in a given side):
*   *   four points of the juts/slots themselves
    *   angles of the puzzles themselves
    *   the entire juts/slots
    *   the "neck" of the juts/slots itself
    *   the "top" of the juts/slots itself
    *   the size of the entire juts/slots.
*   You can create columns - a column will appear at the junction of two puzzles, and both of these puzzles will have a concavity.
*   You can edit the array of convexity/concavity to create your own overall puzzle pattern.
*   When "Automatically Update" is enabled, all parameter changes will immediately affect the appearance of the puzzles (you don't need to click "Generate" or "Update" every time)

> [!WARNING]\
> The important parts of the source code is encrypted - don't be alarmed, this is not a mistake, I did it on purpose. I don't want to publish the source code itself, but from these files you can understand the size of the project and its complexity. Therefore, the "Generate" button will not do anything (since the code is encrypted and commented out). This script is for reference only, not for use, sorry;)

---

Цель скрипта: генерирует N x M пазлов.

При создании 3D пазлов на них можно наложить любую картинку и отрендерить либо напечатать на 3D принтере.

При создании 2D пазлов их можно экспортировать shape как файл для Adobe Illustrator и пользоваться векторной формой.

#### Возможности скрипта:
*   Генерировать как 2D пазлы, так и объёмные 3D пазлы.
*   Можно управлять seed самих пазлов, смещений, а также колонн.
*   Можно управлять типом формы (насколько круглая или квадратная) пазлов.
*   Можно создавать N x M не только в виде прямоугольника, но и в виде бесконечных пазлов - можно скопировать эти N x M пазлов целым блоком и разместить рядом с текущими (справа/слева/сверху/снизу) и они будут стыковаться.
*   Можно управлять смещениями в (можно выбирать только отдельные точки, а также режим, когда "+" или "-" у смещения будет зависеть от того, что в данной стороне выгнутость или вогнутость):
*   *   четырёх точках самих выгнутостей/вогнутостей
    *   углах самих пазлов
    *   самой всей выгнутости/вогнутости
    *   "горлышке" самих выгнутости/вогнутости
    *   "верхушке" самих выгнутости/вогнутости
    *   размере всей выгнутости/вогнутости.
*   Можно создавать колонны - это на стыке двух пазлов появится колонна, а у обоих этих пазла будет вогнутость.
*   Можно редактироть массив выгнутостей/вогнутостей для придания собственного общего узора пазлов.
*   При включении "Automatically Update" все изменения параметров будут сразу же влиять на внешний вид пазлов (Вам не нужно нажимать каждый раз "Generate" или "Update")

> [!WARNING]\
> Важные части исходного кода зашифрованы — не пугайтесь, это не ошибка, я сделал это специально. Сам исходный код публиковать не хочу, но по этим файлам можно понять размер проекта и его сложность. Поэтому кнопка «Generate» не будет ничего делать (т.к. код зашифрован и закомментирован). Этот скрипт предназначен только для ознакомления, а не для использования, извините;)
