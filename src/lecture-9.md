Polar Coordinates
=================

In this lecture you will learn about a new way of describing points in the plane, polar coordinates.

### How does radar work?

To warm ourselves up, let's think for a second about radar. 
How does a radar work? The antenna sweeps around broadcasting a signal. The signal bounces off of objects and comes back. The radar records the direction and distance to locate the object.

This is a system that uses two numbers -- sweep angle and distance -- to describe postions.

#### Radar gives us a new description of the plane using numbers

The radar defines a new coordinate system. To locate a point in the
plane one can:

-   Find its distance $r$ from the origin.
-   Find its angle $\theta$ counterclockwise from the $x$-axis.
-   The pair $(r,\theta)$ determines the location of the point, with
    one caveat: one point can have several different sets of polar
    coordinates! (Give infinitely many examples. Now.)

Here's a demo you can play with. If you put your mouse on the big circle, you will see what the Cartesian coordinates of the point you are aiming for are. The controls show you the radar coordinates.

<div id="radar-system">
<div id="democontainer" style="height: 250px; width: 400px"></div>
<div id="democontrols" style="font-size:small"></div>
<img src="media/lecture-9-radar-system.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    firstdemo = function() {
    $("div#radar-system> img").hide();
    var demo, graph, gui, previousPoint, rcontrol, showTooltip, thetacontrol;
    demo = function() {
      this.r = 1;
      this.theta = 0;
      this.render = function(rad, theta) {
        var d1, data, options, p1, t;
        d1 = [];
        p1 = [[rad * Math.cos(theta), rad * Math.sin(theta)]];
        t = 0;
        while (t <= 2 * Math.PI) {
          d1.push([rad * Math.cos(t), rad * Math.sin(t)]);
          t += 0.01;
        }
        data = [
          d1, {
            data: p1,
            color: "purple",
            hoverable: true,
            points: {
              show: true
            }
          }
        ];
        options = {
          series: {
            lines: {
              show: true,
              shadowSize: 0
            }
          },
          grid: {
            hoverable: true
          },
          xaxis: {
            max: 6,
            min: -6
          },
          yaxis: {
            max: 3.75,
            min: -3.75
          }
        };
        $.plot($("#democontainer"), data, options);
        return null;
      };
      return null;
    };
    graph = new demo();
    gui = new dat.GUI({
      autoPlace: false
    });
    $("#democontrols").append(gui.domElement);
    rcontrol = gui.add(graph, "r", 0, 3.5);
    thetacontrol = gui.add(graph, "theta", 0, 2 * Math.PI);
    graph.render(graph.r, graph.theta);
    rcontrol.onChange(function(value) {
      graph.render(value, graph.theta);
      return null;
    });
    thetacontrol.onChange(function(value) {
      graph.render(graph.r, value);
      return null;
    });
    showTooltip = function(x, y, contents) {
      $("<div id=\"tooltip\">" + contents + "</div>").css({
        position: "absolute",
        display: "none",
        top: y + 5,
        left: x + 5,
        border: "1px solid #fdd",
        padding: "2px",
        "background-color": "#fee",
        opacity: 0.80
      }).appendTo("body").fadeIn(200);
      return null;
    };
    previousPoint = null;
    $("#democontainer").bind("plothover", function(event, pos, item) {
      var x, y;
      $("#x").text(pos.x.toFixed(2));
      $("#y").text(pos.y.toFixed(2));
      if (item) {
        if (previousPoint !== item.dataIndex) {
          previousPoint = item.dataIndex;
          $("#tooltip").remove();
          x = item.datapoint[0].toFixed(2);
          y = item.datapoint[1].toFixed(2);
          showTooltip(item.pageX, item.pageY, "(" + x + "," + y + ")");
        }
      } else {
        $("#tooltip").remove();
      }
      return null;
    });
    return null;
  };

  firstdemo();

}());
//]]>
</script>


#### Code name: polar coordinates

Because we can think of this coordinate system as a sequence of concentric circles arranged around a pole, we call this *polar coordinates*. It is possible to translate between the Cartesian and polar coordinate systems, although one direction is much more mysterious than the other.

#### Converting between coordinate systems

To convert from polar coordinates $(r, \theta)$ to Cartesian coordinates $(x, y)$, we can use the formulas $$x=r\cos(\theta),
    y=r\sin(\theta).$$
Where does this come from? Trigonometry.... You know how to find Cartesian coordinates of points on circles centered at the origin due to your extensive training in trigonometry and the Cartesian coordinate system!

For example, the point with polar coordinates $(r,\theta)=(7,\pi)$ has Cartesian coordinates $$(x,y)=(7\cos(\pi),7\sin(\pi))=(-7,0).$$

Converting in other direction is more fun: first, $r=\sqrt{x^2+y^2}$. To get the angle, you could *try* to use $$\tan(\theta)=\frac{y}{x}$$ when this makes sense, or you could use one of the formulas $x=r\cos(\theta)$ or $y=r\sin(\theta)$. Why does it say "try" back there? Because *no single formula is guaranteed to work*. That's right. Even though this is mathematics, it does not mean that there is always a single formula for any given task. **You must use your brain at all times.** 

*Why* is it harder to go from Cartesian coordinates to polar coordinates than vice versa? One reason is that polar coordinates are overdetermined: there are *many* ways to describe a single point using polar coordinates. For example, the point with polar coordinates $(r, \theta) = (1, 0)$ also has polar coordinates $(1, 2\pi)$, $(1, 4\pi)$, .... On the other hand, there is a *unique* way to represent that point with Cartesian coordinates: $(x, y) = (1, 0)$. 

This overdetermined nature of the polar coordinate system makes things harder for humans because *we have to make choices to work with polar coordinates*. Every time we have to make decisions about how to proceed -- these decisions being necessitated by ambiguity inherent in the mathematical objects -- we have *opportunities to get into trouble*. Do not take these opportunities. Be careful and methodical. Write down your work so you can backtrack through your decisions.

**Meta-claim**: I (@maxlieblich) assert that most of the mistakes you have ever made (in mathematics) arose because you had a chance to make a choice, and you either

1. did not realize you were making a choice (for example, solving $x^2=x$ by first dividing by $x$: choosing to exclude $x=0$)
2. did not realize what choices you had (tried solving $x^2=x$ with the quadratic formula because your mother told you to)
3. made a bad choice (screwed up the quadratic formula and got $x = 0.5 \pm 2 i$)

#### Writing equations

We can use these formulae to convert equations between coordinate systems. What does this mean? An equation is a constraint that determines a special set of points in the plane. This constraint can be phrased in the Cartesian Language ("$x^2+y^2=1$") or in the Polar Language ("r=1"). Some shapes are easier to describe in one coordinate system than the other. Here a few examples.

-   What is the polar equation of a circle of radius $a$ around the
    origin?
    -   $r=a$
-   What is the polar equation of the line $x=3$?
    -   $r\cos(\theta)=3$
-   Try one: find the polar equation of the line $y=2x+5$.
-   Try another one: find the polar equation of the ellipse
    $\frac{1}{2}x^2+\frac{1}{3}y^2=1$

Here's a more sophisticated example: the Cartesian equation of the curve with polar equation $$r=\sin(\theta)$$ is $$x^2+\left(y-\frac{1}{2}\right)^2=\frac{1}{4}.$$

Trick: multiply both sides by $r$, yielding $r^2=r\sin\theta$,
then use $r^2=x^2+y^2$ and $r\sin\theta=y$.

Here are few of these harder ones to try.

-   What is the Cartesian equation corresponding to $r=\sin(\theta)+\cos(\theta)$?
-   How about $r=\cos(\theta)$?
-   Or $r^2=\sec(\theta)$?


### Polar graphs are beautiful

One of the neatest things about polar coordinates is graphing equations, even simple ones. Enjoy these examples. Play with the parameters and watch the magic unfold. Try to guess what will happen when you change a parameter before you do it, and let what happens guide you in making further conjectures.

#### Example 1: $r=\theta^{\textrm{power}}$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$

<div id="plotstickers1-container">
<div id="plotstickers1controls" style="font-size: small; margin-bottom: 20px;"></div>
<div id="plotstickers1" style="width: 470px; height: 470px"></div>
<img src="media/lecture-9-plotstickers1.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    plotstickers1 = function() {
    $("#plotstickers1-container img").hide();
    var gui, multiplecontrol, powercontrol, snail, spiral;
    spiral = function() {
      this.power = 1;
      this.multiple = 2;
      this.render = function(p, m) {
        var d1, data, nut, options, t;
        d1 = [];
        t = 0;
        while (t <= m * Math.PI) {
          d1.push([Math.pow(t, p) * Math.cos(t), Math.pow(t, p) * Math.sin(t)]);
          t += 0.01;
        }
        data = [d1];
        nut = Math.max(Math.pow(this.multiple * Math.PI, this.power), 1 / Math.pow(this.multiple * Math.PI, this.power));
        options = {
          series: {
            lines: {
              show: true,
              shadowSize: 0
            }
          },
          xaxis: {
            max: nut,
            min: -nut
          },
          yaxis: {
            max: nut,
            min: -nut
          }
        };
        $.plot($("#plotstickers1"), data, options);
        return null;
      };
      return null;
    };
    snail = new spiral();
    gui = new dat.GUI({
      autoPlace: false
    });
    $("#plotstickers1controls").append(gui.domElement);
    powercontrol = gui.add(snail, "power", -2, 3);
    multiplecontrol = gui.add(snail, "multiple", 1, 10);
    snail.render(snail.power, snail.multiple);
    powercontrol.onChange(function(value) {
      snail.render(value, snail.multiple);
      return null;
    });
    multiplecontrol.onChange(function(value) {
      snail.render(snail.power, value);
      return null;
    });
    return null;
  };

  plotstickers1();
}());
//]]>
</script>

#### Example 2: $r=\sin(\textrm{love}\cdot\theta)$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$
<div id="plotstickers2-container">
<div id="plotstickers2controls" style="font-size: small; margin-bottom: 20px;"></div>
<div id="plotstickers2" style="width: 470px; height: 470px"></div>
<img src="media/lecture-9-plotstickers2.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    plotstickers2 = function() {
    $("#plotstickers2-container img").hide();
    var bowl, gui, multiplecontrol, powercontrol, yummy;
    yummy = function() {
      this.love = 8 / 5;
      this.multiple = 10;
      this.render = function(p, m) {
        var d1, data, options, t;
        d1 = [];
        t = 0;
        while (t <= m * Math.PI) {
          d1.push([Math.sin(p * t) * Math.cos(t), Math.sin(p * t) * Math.sin(t)]);
          t += 0.01;
        }
        data = [d1];
        options = {
          series: {
            lines: {
              show: true,
              shadowSize: 0
            }
          },
          xaxis: {
            max: 1,
            min: -1
          },
          yaxis: {
            max: 1,
            min: -1
          }
        };
        $.plot($("#plotstickers2"), data, options);
        return null;
      };
      return null;
    };
    bowl = new yummy();
    gui = new dat.GUI({
      autoPlace: false
    });
    $("#plotstickers2controls").append(gui.domElement);
    powercontrol = gui.add(bowl, "love", 0, 5).step(0.1);
    multiplecontrol = gui.add(bowl, "multiple", 10, 50);
    bowl.render(bowl.love, bowl.multiple);
    powercontrol.onChange(function(value) {
      bowl.render(value, bowl.multiple);
      return null;
    });
    multiplecontrol.onChange(function(value) {
      bowl.render(bowl.love, value);
      return null;
    });
    return null;
  };

  plotstickers2();
}());
//]]>
</script>

#### Example 3: $r=c+\sin(\textrm{love}\cdot\theta)$, $0\leq\theta\leq
\textrm{multiple}\cdot\pi$
<div id="plotstickers3-container">
<div id="plotstickers3controls" style="font-size: small; margin-bottom: 20px;"></div>
<div id="plotstickers3" style="width: 470px; height: 470px"></div>
<img src="media/lecture-9-plotstickers3.png"></img>
</div>
<script type="text/javascript">
//<![CDATA[
(function(){
    plotstickers3 = function() {
    $("#plotstickers3-container img").hide();
    var bowl, ccontrol, gui, jiggly, multiplecontrol, powercontrol;
    jiggly = function() {
      this.c = 1;
      this.love = 1;
      this.multiple = 2;
      this.render = function(c, p, m) {
        var d1, data, options, t;
        d1 = [];
        t = 0;
        while (t <= m * Math.PI) {
          d1.push([(c + Math.sin(p * t)) * Math.cos(t), (c + Math.sin(p * t)) * Math.sin(t)]);
          t += 0.01;
        }
        data = [d1];
        options = {
          series: {
            lines: {
              show: true,
              shadowSize: 0
            }
          },
          xaxis: {
            max: 6,
            min: -6
          },
          yaxis: {
            max: 6,
            min: -6
          }
        };
        $.plot($("#plotstickers3"), data, options);
        return null;
      };
      return null;
    };
    bowl = new jiggly();
    gui = new dat.GUI({
      autoPlace: false
    });
    $("#plotstickers3controls").append(gui.domElement);
    powercontrol = gui.add(bowl, "love", 0, 5).step(0.1);
    multiplecontrol = gui.add(bowl, "multiple", 1, 50);
    ccontrol = gui.add(bowl, "c", 0, 5);
    bowl.render(bowl.c, bowl.love, bowl.multiple);
    powercontrol.onChange(function(value) {
      bowl.render(bowl.c, value, bowl.multiple);
      return null;
    });
    multiplecontrol.onChange(function(value) {
      bowl.render(bowl.c, bowl.love, value);
      return null;
    });
    ccontrol.onChange(function(value) {
      bowl.render(value, bowl.love, bowl.multiple);
      return null;
    });
    return null;
  };

  plotstickers3();
}());
//]]>
</script>

### Videos
[Video chunk 9](http://www.math.washington.edu/~lieblich/Math126/video/9.mp4)

### Content Contributors
@maxlieblich
