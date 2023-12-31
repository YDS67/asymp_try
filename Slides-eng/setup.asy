void preamble() {
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
  real dw=a*0.017;
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
        darkblue,
        RGB(193,193,232),
        darkgray,
        gray,
    };

    real head_height = 8.2;
    path canvas = box((0,0),(16,9));
    path head = box((0,head_height),(16,9));
    path head_shadow = box((0,8),(16,head_height));
    path foot = (0,0) -- (0,0.6) -- (16,0.6) -- (16,0) --cycle;
    path footline = (0,0.6) -- (16,0.6);
    int slide_no = 1;
    real frill_r = 0.2;
    real frill_start = 8.4;
    path frill = (0,9) -- arc((0,frill_start+frill_r),frill_r,-90,0) -- arc((2*frill_r,frill_start+frill_r),frill_r,180,90) -- arc((2*frill_r,frill_start+3*frill_r),frill_r,-90,0) -- cycle;
    //path frill = (0,9) -- (0,frill_start - (sqrt(2)-1)*frill_r) -- arc((0,frill_start+frill_r),frill_r,-45,0) -- arc((2*frill_r,frill_start+frill_r),frill_r,180,90) -- arc((2*frill_r,frill_start+3*frill_r),frill_r,-90,-45) -- ((2+sqrt(2))*frill_r,9) -- cycle;

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
        fill(this.canvas,this.cols[0]);
        //draw_frill();
        label(graphic("img/logo.pdf", "width=3cm"), (8,8.5), align=S);
        layer();
        pen p1 = RGB(233,233,243);
        pen p2 = RGB(38,38,134)+linewidth(1);
        string txt = "\centering \textbf{"+this.title+"}";
        pen p = fontsize(18pt)+this.cols[1];
        picture pic;
        label(pic, minipage(txt, 13cm),p);
        frame fr = pic.fit();
        roundbox1(fr,xmargin=0.5cm,ymargin=0.2cm,Fill(p1));
        roundbox1(fr,Draw(p2));
        add(fr,(8,5.5));

        pen p = fontsize(13pt)+this.cols[3];
        label(minipage("\centering \textit{"+this.author+"}", 14cm),(8,3.3), p);
        pen p = fontsize(13pt)+this.cols[3];
        label(minipage("\centering "+this.institution, 14cm), (8,2), p);
        pen p = fontsize(13pt)+this.cols[3];
        label(this.date, (8,1), align = S, p);
    }

    void add_section(string title) {
        newpage();
        //canvas
        fill(this.canvas,this.cols[0]);
        draw_frill();

        pen p = fontsize(20pt)+this.cols[1];
        label(minipage("\centering \textbf{"+title+"}", 14cm),(8,5), p);
        
    }

    void add_text_column (string a, real x, real w = 7.1, real dh = 1) {
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, width = w*cm),(x,7.8-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_wide (string a, real dh = 1) {
        real h = 0;
        file text = input("text/"+a);
        while(eof(text) == false) {
            string txt = text;
            pen p = fontsize(12pt);
            label(minipage(txt, 14.8cm),(0.6,7.8-h), align=SE, p);
            h += dh;
        }
    }

    void add_text_important (string a) {
        pen p1 = RGB(233,233,243);
        pen p2 = RGB(38,38,134)+linewidth(1);
        file text = input("text/"+a);
        string txt = text;
        pen p = fontsize(12pt);
        picture pic;
        label(pic, minipage(txt, 14cm),p);
        frame fr = pic.fit();
        roundbox1(fr,xmargin=0.5cm,Fill(p1));
        roundbox1(fr,Draw(p2));
        add(fr,(8,4.5));
    }

    void add_text_right (string a, real w = 7.1, real dh = 1) {
        add_text_column(a, x=8.3+7.1-w, w=w);
    }

    void add_text_left (string a, real w = 7.1, real dh = 1) {
        add_text_column(a, x=0.6, w=w);
    }

    void add_img_left (string a, real w = 7.1) {
        label(graphic("img/"+a, "width="+string(w)+"cm"), (0.6,7.8), align=SE);
    }

    void add_img_right (string a, real w = 7.1) {
        label(graphic("img/"+a, "width="+string(w)+"cm"), (8.3-w+7.1,7.8), align=SE);
    }

    void add_background (string a) {
        label(graphic("img/"+a, "width=15.9cm, height=8.9cm"),(8,4.5));
        layer();
    }

    void add_slide (string header="", bool show_head=true, bool show_foot=true) {
        newpage();
        //canvas
        fill(this.canvas,this.cols[0]);

        //header
        if(show_head) {
            //axialshade(this.head,this.cols[2],(0,9),this.cols[0],(0,8));
            fill(this.head,this.cols[2]);
            axialshade(this.head_shadow,black,(0,9),white,(0,8));
            pen p = fontsize(15pt)+this.cols[1];
            label("\textbf{"+header+"}",(8,9), align = S, p);
        }
        
        //footer
        if(show_foot) {
            fill(this.foot,this.cols[0]);
            draw(this.footline,this.cols[2]+dotted);

            pen p = fontsize(12pt)+this.cols[4];
            label(string(this.slide_no),(15.9,0), align = N+W, p);
            pen p = fontsize(10pt)+this.cols[4];
            label("\copyright ~\textit{"+this.short_author+"}, "+this.short_institution,(0.1,0), align = N+E, p);
        //end
        }

        this.slide_no += 1;
    };

    void add_slide_empty() {
        newpage();
        //canvas
        fill(this.canvas,this.cols[0]);

        this.slide_no += 1;
    };

};

