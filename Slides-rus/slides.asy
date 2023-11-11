import animation;
import setup;
import logo;
import figures;

preamble();

presentation P;

P.title = "Название презентации";
P.author = "Автор";
P.affiliation = "Организация";
P.date = "Ноябрь 2023";

animation A;

save();
P.add_title();
A.add();
restore();

save();
P.add_slide("Заголовок первого слайда");

P.add_text_right("text1.txt");

frame figure1 = align(fig1().fit(),(1.25cm,1.5cm));
add(figure1);

A.add();
restore();

save();
P.add_slide("Заголовок второго слайда");

P.add_text_left("formula1.txt");

frame figure2 = align(fig2().fit(),(8.5cm,4cm));
add(figure2);

A.add();
restore();

save();
P.add_slide("Заголовок третьего слайда");

P.add_text_left("text2.txt");

draw(graphic("wavepacket.png", "width=6cm"), (9,7.5), align=SE);

A.add();
restore();

P.title = "Спасибо за внимание!";
P.author = "111@111.com";
P.affiliation = " ";
P.date = " ";

save();
P.add_title();
A.add();
restore();

A.movie();
