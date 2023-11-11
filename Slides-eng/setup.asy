import logo;

void preamble() {

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
    pair pos = (0,0);

    string title;
    string author;
    string affiliation;
    string date;

    void add_title() {
        fill(this.canvas,this.cols[0]);
        picture logo = logo((1,15),this.cols[2]);
        size(logo,140,80,IgnoreAspect);
        add(logo.fit());
        pen p = fontsize(22pt)+this.cols[1];
        label("\textbf{"+this.title+"}",(8,6), align = N, p);
        pen p = fontsize(14pt)+this.cols[3];
        label("\textit{"+this.author+"}",(11,4), align = N, p);
        pen p = fontsize(14pt)+this.cols[3];
        label(this.affiliation, (11,3), align = N, p);
        pen p = fontsize(14pt)+this.cols[3];
        label(this.date, (11,2), align = N, p);
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

    void add_text_right (string a, real dh = 1) {
        add_text_column(a, 8);
    }

    void add_text_left (string a, real dh = 1) {
        add_text_column(a, 1);
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
        label("\textit{"+this.title+", "+this.author+"}",(0,0), align = N+E, p);
        //end
        this.slide_no += 1;
    };

};

