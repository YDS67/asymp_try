void preamble() {

    texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
    defaultpen(font("T2A","cmr","m","n"));
    unitsize(1cm);
    settings.outformat = "pdf";
    settings.tex = "pdflatex";

};

struct poster {
    pen []cols = {
        white,
        darkblue,
        RGB(193,193,232),
        darkgray,
        gray,
    };

    real head_height = 8.2;
    path canvas = box((0,0),(84,118.8));
    path title_box = box((2,106),(82,116));
   
    string title;
    string short_title = title;
    string author;
    string short_author = author;
    string institution;
    string short_institution = institution;
    string date;

    void fill_short(string title = this.title, 
        string author = this.author, 
        string institution = this.institution) {
        this.short_title = title;
        this.short_author = author;
        this.short_institution = institution;
    }

    void add_title() {
        fill(this.canvas,this.cols[0]);
        fill(this.title_box,this.cols[2]);
        //label(graphic("img/logo.pdf", "width=4cm"), (8,8.5), align=S);
        pen p = fontsize(90pt)+this.cols[1];
        label(minipage("\centering \textbf{"+this.title+"}", 76cm),(42,114.5), p);
        pen p = fontsize(66pt)+this.cols[3];
        label(minipage("\centering \textit{"+this.author+"}", 76cm),(42,112), p);
        pen p = fontsize(66pt)+this.cols[3];
        label(minipage("\centering "+this.institution, 76cm), (42,109.5), p);
        pen p = fontsize(66pt)+this.cols[3];
        label(this.date, (42,108.5), align = S, p);
    }

  
    void add_text_column (string a, real x, real dh = 1) {
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 7cm),(x,7.5-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_wide (string a, real dh = 1) {
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 14cm),(1,7.5-h), align=SE, p);
            h += dh;
        }
    }


    void add_img_left (string a, real w = 6) {
        label(graphic("img/"+a, "width="+string(w)+"cm"), (1,7.5), align=SE);
    }

    void add_img_right (string a, real w = 6) {
        label(graphic("img/"+a, "width="+string(w)+"cm"), (8,7.5), align=SE);
    }

};

