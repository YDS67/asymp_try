### 1. Geometry and Impact Parameter

Let the velocity direction of the particles be defined by the angle $\theta$. The normal vector to this velocity is $\vec{n} = (-\sin\theta, \cos\theta)$.

We define the **impact parameter** $\beta$ as the perpendicular signed distance from the center of the ellipse (the origin) to the line of trajectory of a specific particle.


The equation of the line for a particle with impact parameter $\beta$ is:
$$-\sin(\theta)x + \cos(\theta)y = \beta$$

* If $\beta = 0$, the particle aims directly at the center.
* $\beta$ varies across the "width" of the ellipse relative to the incoming angle.

### 2. The Range of Valid $\beta$ (Effective Cross-Section)

The valid range of $\beta$ corresponds to the lines that actually intersect the ellipse. The limits of this range are defined by the two lines parallel to the velocity that are **tangent** to the ellipse.

The range of valid impact parameters is $\beta \in [-\beta_{max}, \beta_{max}]$, where:

$$\beta_{max} = \sqrt{a^2 \sin^2\theta + b^2 \cos^2\theta}$$


### 3. The Contact Point $P(\beta)$

The flux comes from the negative quadrant (bottom-left). A line passing through the ellipse intersects it at two points; the **contact point** is the first intersection the particle encounters (the "upstream" side).

By solving the system of equations formed by the line $-\sin(\theta)x + \cos(\theta)y = \beta$ and the ellipse $\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1$, and selecting the root corresponding to the incoming side, we obtain the coordinates $P(\beta) = (x(\beta), y(\beta))$:

$$x(\beta) = \frac{-a^2 \beta \sin\theta - ab \cos\theta \sqrt{\beta_{max}^2 - \beta^2}}{\beta_{max}^2}$$

$$y(\beta) = \frac{b^2 \beta \cos\theta - ab \sin\theta \sqrt{\beta_{max}^2 - \beta^2}}{\beta_{max}^2}$$
