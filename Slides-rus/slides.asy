import setup;

int main(int slides=1) {

// Initial settings
preamble();
presentation P;

// General information
P.title = "Квантовое моделирование транспорта квазидвумерных электронов в слое наноструктур";
P.author = "\textbf{Ю.Д. Сибирмовский}, к.ф.-м.н., доцент \\ соавторы: ...";
P.institution = "Национальный исследовательский ядерный университет <<МИФИ>>,\\Институт нанотехнологий в электронике, спинтронике и фотонике";
P.date = "Москва, Ноябрь 2023";
P.slides = slides-1;

P.fill_short("Электронный транспорт ...", "Ю.Д.Сибирмовский", "ИНТЭЛ НИЯУ МИФИ");

// Main title slide
P.add_title();

// Slide 1
P.add_slide("Введение");

P.add_text_right("text1.tex");

P.add_img_left("trajectory.png",6.5);

// Section title, page numbers don't increase
P.add_section("Объект исследования");

// Slide 2
P.add_slide("Second slide title");

P.add_text_left("formula1.tex", w=5);

// second parameter is width, can be a real number
P.add_img_right("distribution.png", w=9);

// Slide 3, without the footer, but page number still increases
P.add_slide("Third slide title",show_foot=false);

P.add_text_left("text2.tex");

// full code to add images in not-standard places
label(graphic("img/wavepacket-0.png", "width=6cm"), (9,7.8), align=SE);
label(graphic("img/wavepacket-1.png", "width=6cm"), (9,4), align=SE);

// Slide 4
P.add_slide("Fourth slide title");

// second parameter is width, can be a real number
P.add_img_left("spectrum.pdf", 8);

// small width of text
P.add_text_right("text3.tex", w=6.5);

// Slide 5
P.add_slide("5th slide title");

P.add_text_left("text1.tex");
P.add_text_right("text1.tex");

// Slide 6
P.add_slide("5th slide title");

P.add_text_important("text1.tex");

// Conclusion
P.add_slide("Заключение");
P.add_text_wide("conclusion.tex");

// Final slide
P.title = "Спасибо за внимание!";
P.author = "YDSibirmovsky@mephi.ru";
P.institution = "";

if(P.slides>1){
    newpage();
};
P.add_title();

return P.slide_no;

}

main(main());