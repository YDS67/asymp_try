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

draw(graphic("trajectory.png", "width=6cm"), (1,7.5), align=SE);

// Slide 2
P.add_slide("Second slide title");

P.add_text_left("formula1.txt");

draw(graphic("distribution.png", "width=7cm"), (8,7.5), align=SE);

// Slide 3
P.add_slide("Third slide title");

P.add_text_left("text2.txt");

draw(graphic("wavepacket-0.png", "width=5cm"), (9,7.5), align=SE);
draw(graphic("wavepacket-1.png", "width=5cm"), (9,4.2), align=SE);

// Slide 4
P.add_slide("Fourth slide title");

draw(graphic("spectrum.pdf", "width=8cm"), (1,7.5), align=SE);

// small width of text
P.add_text_sright("text3.txt");

// Conclusion
P.add_slide("Заключение");
P.add_text_wide("conclusion.txt");

// Final slide
P.title = "Спасибо за внимание!";
P.author = P.author + "\\YDSibirmovsky@mephi.ru";
P.institution = "";

newpage();
P.add_title();

