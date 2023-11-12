import setup;

// Initial settings
preamble();
presentation P;

// General information
P.title = "Квантовое моделирование транспорта квазидвумерных электронов в слое наноструктур";
P.author = "\textbf{Ю.Д. Сибирмовский}, к.ф.-м.н., доцент \\ соавторы: ...";
P.institution = "Национальный исследовательский ядерный университет <<МИФИ>>,\\Институт нанотехнологий в электронике, спинтронике и фотонике";
P.date = "Москва, Ноябрь 2023";

P.fill_short("Электронный транспорт ...", "Ю.Д.Сибирмовский", "ИНТЭЛ НИЯУ МИФИ");

// Main title slide
P.add_title();

// Slide 1
P.add_slide("First slide title");

P.add_text_right("text1.txt");

P.add_img_left("trajectory.png");

// Slide 2
P.add_slide("Second slide title");

P.add_text_left("formula1.tex");

// second parameter is width, can be a real number
P.add_img_right("distribution.png", w=7);

// Slide 3
P.add_slide("Third slide title");

P.add_text_left("text2.txt");

// full code to add images in not-standard places
label(graphic("img/wavepacket-0.png", "width=5cm"), (9,7.5), align=SE);
label(graphic("img/wavepacket-1.png", "width=5cm"), (9,4.2), align=SE);

// Slide 4
P.add_slide("Fourth slide title");

// second parameter is width, can be a real number
P.add_img_left("spectrum.pdf", 8);

// small width of text
P.add_text_sright("text3.txt");

// Conclusion
P.add_slide("Заключение");
P.add_text_wide("conclusion.tex");

// Final slide
P.title = "Спасибо за внимание!";
P.author = P.author + "\\YDSibirmovsky@mephi.ru";
P.institution = "";

newpage();
P.add_title();

