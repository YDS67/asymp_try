void preamble() {

    texpreamble("\usepackage{mathtext}\usepackage[russian]{babel}");
    defaultpen(font("T2A","cmr","m","n"));

    unitsize(1cm);
    settings.outformat = "pdf";

};

struct settings {
    pen []cols = {
        white,
        darkblue,
        paleblue,
        darkgray,
    };

    path canvas = (0,0) -- (0,9) -- (16,9) -- (16,0) --cycle;
    path head = (0,8) -- (0,9) -- (16,9) -- (16,8) --cycle;
    path foot = (0,0) -- (0,0.6) -- (16,0.6) -- (16,0) --cycle;
    path footline = (0,0.6) -- (16,0.6);
    int slide_no = 1;

    string title;
    string author;
    string data;

    void title_init () {
        fill(this.canvas,this.cols[0]);
        pen p = fontsize(20pt)+this.cols[1];
        label("\textbf{"+this.title+"}",(8,5), align = N, p);
        pen p = fontsize(16pt)+this.cols[3];
        label("\textit{"+this.author+"}",(8,4), align = N, p);
        pen p = fontsize(14pt)+this.cols[3];
        label(this.data, (8,3), align = N, p);
    };

    void slide_init (string header) {
        //canvas
        fill(this.canvas,this.cols[0]);
        //header
        axialshade(this.head,this.cols[2],(0,9),this.cols[0],(0,8));
        pen p = fontsize(15pt)+this.cols[1];
        label("\textbf{"+header+"}",(8,9), align = S, p);

        //footer
        fill(this.foot,this.cols[0]);
        draw(this.footline,this.cols[2]+dotted);

        pen p = fontsize(12pt)+this.cols[3];
        label(string(this.slide_no),(16,0), align = N+W, p);
        pen p = fontsize(10pt)+this.cols[3];
        label("\textit{"+this.title+", "+this.author+"}",(0,0), align = N+E, p);
        //end
        this.slide_no += 1;
    };

};
