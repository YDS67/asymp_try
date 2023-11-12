void preamble() {

    texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
    defaultpen(font("T2A","cmr","m","n"));
    unitsize(1cm);
    settings.outformat = "pdf";
    settings.tex = "pdflatex";

};

struct presentation {
    pen []cols = {
        white,
        darkblue,
        paleblue,
        darkgray,
        gray,
    };

    path canvas = (0,0) -- (0,9) -- (16,9) -- (16,0) --cycle;
    path head = (0,8) -- (0,9) -- (16,9) -- (16,8) --cycle;
    path foot = (0,0) -- (0,0.6) -- (16,0.6) -- (16,0) --cycle;
    path footline = (0,0.6) -- (16,0.6);
    int slide_no = 1;

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
        label(graphic("logo.pdf", "width=4cm"), (8,8.5), align=S);
        pen p = fontsize(22pt)+this.cols[1];
        label(minipage("\centering \textbf{"+this.title+"}", 14cm),(8,7), align = S, p);
        pen p = fontsize(13pt)+this.cols[3];
        label(minipage("\centering \textit{"+this.author+"}", 14cm),(8,4), align = S, p);
        pen p = fontsize(13pt)+this.cols[3];
        label(minipage("\centering "+this.institution, 14cm), (8,2.5), align = S, p);
        pen p = fontsize(13pt)+this.cols[3];
        label(this.date, (8,1), align = S, p);
    }

    void add_text_column (string a, real x, real dh = 1) {
        real h = 0;
        file text = input(a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 7cm),(x,7.5-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_wide (string a, real dh = 1) {
        real h = 0;
        file text = input(a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 14cm),(1,7.5-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_right (string a, real dh = 1) {
        add_text_column(a, 8);
    }

    void add_text_left (string a, real dh = 1) {
        add_text_column(a, 1);
    }

    void add_text_small (string a, real x, real dh = 1) {
        real h = 0;
        file text = input(a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 5cm),(x,7.5-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_sright (string a, real dh = 1) {
        add_text_small(a, 10);
    }

    void add_text_sleft (string a, real dh = 1) {
        add_text_small(a, 1);
    }

    void add_slide (string header) {
        newpage();
        //canvas
        fill(this.canvas,this.cols[0]);
        //header
        axialshade(this.head,this.cols[2],(0,9),this.cols[0],(0,8));
        pen p = fontsize(15pt)+this.cols[1];
        label("\textbf{"+header+"}",(8,9), align = S, p);

        //footer
        fill(this.foot,this.cols[0]);
        draw(this.footline,this.cols[2]+dotted);

        pen p = fontsize(12pt)+this.cols[4];
        label(string(this.slide_no),(16,0), align = N+W, p);
        pen p = fontsize(10pt)+this.cols[4];
        label("\copyright ~\textit{"+this.short_author+"}, "+this.short_institution,(0,0), align = N+E, p);
        //end
        this.slide_no += 1;
    };

};

