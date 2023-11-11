import animation;
import setup;

preamble();

settings s;

s.title = "Название доклада";
s.author = "Автор";
s.data = "Ноябрь 2023";

animation A;

save();
s.title_init();
A.add();
restore();

save();
s.slide_init("Первый слайд");
A.add();
restore();

save();
s.slide_init("Второй слайд");
A.add();
restore();

save();
s.slide_init("Третий слайд");
A.add();
restore();

A.movie(0,10);
