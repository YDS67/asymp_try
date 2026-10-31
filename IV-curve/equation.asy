import graph;

texpreamble("\usepackage{mathtext}\usepackage{unicode-math}\usepackage[russian]{babel}\usepackage{fontspec}\setmainfont{Times New Roman}\setmathfont{Cambria Math}");

settings.tex = "lualatex";

unitsize(1cm);
defaultpen(fontsize(10pt));
settings.render = 8;

path main = box((0,0),(17,4));
fill(main, white);

label("$\displaystyle \frac{d^{2}E}{d\omega d\theta}=\frac{h^{2}\eta^{2}}{4\pi c}\frac{A\sigma^{2}\left|\Phi\left(\omega\right)\right|^{2}\left(\varepsilon-1\right)^{2}\left[\left(1-\beta^{2}\right)\varepsilon+\beta^{2}\cos^{2}\theta_{0}\right]}{\left(\sqrt{1-\varepsilon\beta^{2}}+\varepsilon\sqrt{1-\beta^{2}}\right)^{2}\left(\sqrt{\varepsilon-\cos^{2}\theta_{0}}+\varepsilon\sin\theta_{0}\right)^{2}}\delta\left(\theta-\theta_{0}\right)$", (8.5,3.25));

label("$\displaystyle \sigma=\int_{-\infty}^{+\infty}\mathrm{d}x\mathrm{d}z\,n\left(x,z\right),\quad\Phi\left(\omega\right) = \frac{1}{\sigma}\int_{-\infty}^{+\infty}\mathrm{d}x\mathrm{d}z\,e^{-i\varkappa x}e^{-\eta\left|z\right|}n\left(x,z\right)$", (8.5,2));

label("$\displaystyle \varkappa = \frac{\omega}{c \beta}, \quad \eta = \frac{\omega}{c} \sqrt{1/\beta^{2}-\varepsilon}, \quad \cos \theta_0 = \frac{1}{\beta}-\frac{2\pi c}{a \omega}, \quad \beta = \frac{v}{c}$", (8.5,0.75));

