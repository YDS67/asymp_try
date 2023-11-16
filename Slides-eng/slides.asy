import setup;

// Initial settings
preamble();
presentation P;

// General information
P.title = "Modeling of two-dimensional electron transport in a quantum dot array";
P.author = "\textbf{Presenting author}, PhD \\ coauthors: ...";
P.institution = "University of ...";
P.date = "\today";

P.fill_short("2D electron transport ...", "Presenting author", "University");

// Main title slide
P.add_title();

// Slide 1
P.add_slide("Introduction");

P.add_text_right("text1.tex");

P.add_img_left("trajectory.png",6.5);

// Section title, page numbers don't increase
P.add_section("Section 1");

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
P.add_slide("Conclusion",show_foot=false);
P.add_text_wide("conclusion.tex");

// Final slide
P.title = "Thank you!";
P.author = "email@...";
P.institution = "";

newpage();
P.add_title();