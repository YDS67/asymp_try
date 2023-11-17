void preamble() {
    texpreamble("\usepackage{mathtext} \usepackage[russian]{babel}");
    defaultpen(font("T2A","cmr","m","n"));
    unitsize(1cm);
    settings.outformat = "pdf";
    settings.tex = "pdflatex";
};

path roundbox1(frame dest, frame src=dest, real xmargin=0, real ymargin=xmargin,
	      pen p=currentpen, filltype filltype=NoFill, bool above=true)
{
  pair m=min(src);
  pair M=max(src);
  pair bound=M-m;
  real a=bound.x+2*xmargin;
  real b=bound.y+2*ymargin;
  real ds=0;
  real dw=0.25cm;
  path g=shift(m-(xmargin,ymargin))*((0,dw)--(0,b-dw){up}..{right}
  (dw,b)--(a-dw,b){right}..{down}
  (a,b-dw)--(a,dw){down}..{left}
  (a-dw,0)--(dw,0){left}..{up}cycle);

  frame F;
  if(above == false) {
    filltype.fill(F,g,p);
    prepend(dest,F);
  } else filltype.fill(dest,g,p);
  return g;
}

struct presentation {
    pen []cols = {
        white,
        RGB(41,75,102),
        RGB(73,130,174),
        darkgray,
        gray,
        RGB(224,232,238)
    };

    pen []cols1 = {
        white,
        RGB(38,38,134),
        RGB(193,193,232),
        darkgray,
        gray,
        RGB(233,233,243)
    };

    pen []cols2 = {
        white,
        RGB(41,75,102),
        RGB(73,130,174),
        darkgray,
        gray,
        RGB(224,232,238)
    };

    pen []cols3 = {
        white,
        RGB(4,36,56),
        RGB(74,127,118),
        darkgray,
        gray,
        RGB(218,214,185)
    };

    pen []cols4 = {
        white,
        rgb("0B032D"),
        rgb("9A7787"),
        darkgray,
        gray,
        rgb("FED7BF")
    };

    pen []cols5 = {
        white,
        RGB(0,96,0),
        RGB(204,229,204),
        darkgray,
        gray,
        RGB(230,242,230)
    };

    pen []cols6 = {
        white,
        RGB(128,64,0),
        RGB(252,187,6),
        darkgray,
        gray,
        RGB(254,238,193)
    };

    string logo = "img/logo2.pdf";

    real head_height = 8.2;
    real foot_height = 0.5;
    path canvas = box((0,0),(16,9));
    path head = box((0,head_height),(16,9));
    path head_shadow = box((0,8),(16,head_height));
    path foot = (0,0) -- (0,foot_height) -- (16,foot_height) -- (16,0) --cycle;
    path footline = (0,foot_height) -- (16,foot_height);
    int slide_no = 1;
    int slides = 1;
    real frill_r = 0.2;
    real frill_start = 8.4;
    path frill = (0,9) -- arc((0,frill_start+frill_r),frill_r,-90,0) -- arc((2*frill_r,frill_start+frill_r),frill_r,180,90) -- arc((2*frill_r,frill_start+3*frill_r),frill_r,-90,0) -- cycle;
    
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

    void draw_frill() {
        fill(this.frill,this.cols[2]);
        fill(shift(16,0) * reflect(S,N) * this.frill,this.cols[2]);
        fill(shift(0,9) * reflect(E,W) * this.frill,this.cols[2]);
        fill(shift(16,9) * reflect(E,W) * reflect(S,N) * this.frill,this.cols[2]);
    }

    void add_title() {
        import roundedpath;
        if(this.slides>1){
            layer();
        fill(this.canvas,this.cols[0]);
        
        pen p = fontsize(12pt)+this.cols[3];
        label(minipage("\centering "+this.institution, 14cm), (8,7.8), p);

        pen p1 = this.cols[5];
        pen p2 = this.cols[1]+linewidth(1);
        string txt = "\centering \textbf{"+this.title+"}";
        pen p = fontsize(18pt)+this.cols[1];
        picture pic;
        label(pic, minipage(txt, 13cm),p);
        frame fr = pic.fit();
        roundbox1(fr,xmargin=0.5cm,ymargin=0.2cm,Fill(p1));
        roundbox1(fr,Draw(p2));
        add(fr,(8,5.5));

        label(graphic(this.logo, "width=4cm"), (3.5,2.5));

        pen p = fontsize(12pt)+this.cols[3];
        label(minipage("\textit{"+this.author+"}", 8cm),(10.5,2.5), p);
        
        pen p = fontsize(12pt)+this.cols[3];
        label(this.date, (8,1), align = S, p);
        };
    }

    void add_section(string title) {
        if(this.slides>1){
            //layer();
            newpage();
        //canvas
        fill(this.canvas,this.cols[0]);
        draw_frill();

        pen p = fontsize(20pt)+this.cols[1];
        label(minipage("\centering \textbf{"+title+"}", 14cm),(8,5), p);
        };
    }

    void add_text_column (string a, real x, real w = 7.1, real dh = 1) {
        if(this.slides>1){
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, width = w*cm),(x,7.8-h), align=SE, p);
            h += dh;
        }
        };
    }

    void add_text_wide (string a, real dh = 1) {
        if(this.slides>1){
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 14.8cm),(0.6,7.8-h), align=SE, p);
            h += dh;
        }
        };
    }

    void add_text_important (string a, real x=0, real y=0) {
        if(this.slides>1){
        pen p1 = this.cols[5];
        pen p2 = this.cols[1]+linewidth(1);
        file text = input("text/"+a);
        string txt = text;
        pen p = fontsize(12pt);
        picture pic;
        label(pic, minipage(txt, (14-2*abs(x))*cm),p);
        frame fr = pic.fit();
        roundbox1(fr,xmargin=0.5cm,Fill(p1));
        roundbox1(fr,Draw(p2));
        add(fr,(8+x,4.5+y));
        };
    }

    void add_text_right (string a, real w = 7.1, real dh = 1) {
        add_text_column(a, x=8.3+7.1-w, w=w);
    }

    void add_text_left (string a, real w = 7.1, real dh = 1) {
        add_text_column(a, x=0.6, w=w);
    }

    void add_img_left (string a, real w = 7.1) {
        if(this.slides>1){
        label(graphic("img/"+a, "width="+string(w)+"cm"), (0.6,7.8), align=SE);
        };
    }

    void add_img_right (string a, real w = 7.1) {
        if(this.slides>1){
        label(graphic("img/"+a, "width="+string(w)+"cm"), (8.3-w+7.1,7.8), align=SE);
        };
    }

    void add_background (string a) {
        label(graphic("img/"+a, "width=15.9cm, height=8.9cm"),(8,4.5));
        //layer();
    }

    void add_slide (string header="", bool show_head=true, bool show_foot=true) {
        if(this.slides>1){
            //layer();
            newpage();
        //canvas
        fill(this.canvas,this.cols[0]);

        //header
        if(show_head) {
            //axialshade(this.head,this.cols[2],(0,9),this.cols[0],(0,8));
            fill(this.head,this.cols[2]);
            axialshade(this.head_shadow,black,(0,9),white,(0,8));
            pen p = fontsize(15pt)+this.cols[0];
            label("\textbf{"+header+"}",(8,9), align = S, p);
        }
        
        //footer
        if(show_foot) {
            real fw = 16*this.slide_no/(this.slides);
            path foot2 = (0,0) -- (0,this.foot_height) -- (fw,this.foot_height) -- (fw,0) --cycle;
            fill(foot,this.cols[0]);
            fill(foot2,this.cols[5]);
            draw(this.footline,this.cols[2]+dotted);

            pen p = fontsize(9pt)+this.cols[1];
            label(string(this.slide_no)+"/"+string(this.slides),(15.9,0), align = N+W, p);
            
            pen p = fontsize(9pt)+this.cols[1];
            label("\copyright ~\textit{"+this.short_author+"}, "+this.short_institution,(0.1,0), align = N+E, p);
        //end
        }
        };
        this.slide_no += 1;
    };

    void add_slide_empty() {
        //layer();
        if(this.slides>1){
            newpage();
        
        //canvas
        fill(this.canvas,this.cols[0]);
        };
        this.slide_no += 1;
    };

};

