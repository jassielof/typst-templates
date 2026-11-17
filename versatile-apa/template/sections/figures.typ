#import "../../lib.typ": apa-figure

= Sample figures
// Sample figures taken from https://apastyle.apa.org/style-grammar-guidelines/tables-figures/sample-figures
== Sample bar graph
Referencing @fig:sample-bar-graph.

#apa-figure(
  caption: [Framing Scores for Different Reward Sizes],
  image(
    "../assets/images/sample-bar-graph.png",
    alt: "Framing scores are higher for young adults than adolescents across reward sizes and risk levels. Small rewards have the highest scores in every group. Scores for small and medium rewards are lower under high risk than low risk; large-reward scores change little.",
  ),
  note: [
    Framing scores of adolescents and young adults are shown for low and high risks and for small, medium, and large rewards (error bars show standard errors).
  ],
) <fig:sample-bar-graph>

#pagebreak()
== Sample line graph
Referencing @fig:sample-line-graph.

#apa-figure(
  caption: [Mean Regression Slopes in Experiment 1],
  image(
    "../assets/images/sample-line-graph.png",
    alt: "Across rotations from 25 to 65 degrees, stereo-motion and combined-condition slopes remain above one and generally decline. Both monocular-motion conditions remain below one, with biocular viewing consistently higher than monocular viewing.",
  ),
  note: [
    Mean regression slopes in Experiment 1 are shown for the stereo motion, biocularly viewed monocular motion, combined, and monocularly viewed monocular motion conditions, plotted by rotation amount. Error bars represent standard errors. From “Large Continuous Perspective Change With Noncoplanar Points Enables Accurate Slant Perception,” by X. M. Wang, M. Lind, and G. P. Bingham, 2018, Journal of Experimental Psychology: Human Perception and Performance, 44(10), p. 1513 (#link("https://doi.org/10.1037/xhp0000553")). Copyright 2018 by the American Psychological Association.
  ],
) <fig:sample-line-graph>

== Sample CONSORT flowchart
Referencing @fig:sample-consort-flowchart.

#apa-figure(
  caption: [CONSORT Flowchart of Participants],
  image(
    "../assets/images/sample-consort-flowchart.png",
    alt: "Participant flow: 100 assessed, 30 excluded (21 did not meet criteria; 9 declined), and 70 randomized. Of 49 allocated to the first intervention, 4 withdrew, 45 completed follow-up, and 41 were analyzed after 4 further exclusions (2 unusable data, 1 incomplete scan, and 1 no longer eligible). All 21 allocated to the second intervention completed follow-up and were analyzed. Neither group lost participants to follow-up.",
  ),
) <fig:sample-consort-flowchart>

== Sample path model
Referencing @fig:sample-path-model.

#apa-figure(
  caption: [Path Analysis Model of Associations Between ASMC and Body-Related Constructs],
  image(
    "../assets/images/sample-path-model.png",
    alt: "Appearance-related social media consciousness has paths to body esteem (negative .32), body comparison (.56), and body surveillance (.54). Time spent on social media has respective paths of negative .02, negative .08, and .07. Curved arrows connect the predictors (.20), esteem and comparison (negative .50), esteem and surveillance (negative .42), and comparison and surveillance (.41). All paths except those from time spent on social media carry three asterisks.",
  ),
  note: [
    The path analysis shows associations between ASMC and endogenous body-related variables (body esteem, body comparison, and body surveillance), controlling for time spent on social media. Coefficients presented are standardized linear regression coefficients.],
  probability-note: [#super[\*\*\*]#math.equation(alt: "p less than .001", $p < .001$).],
) <fig:sample-path-model>

== Sample qualitative research figure
Referencing @fig:sample-qualitative-research-figure.

#apa-figure(
  caption: [Organizational Framework for Racial Microaggressions in the Workplace],
  image(
    "../assets/images/sample-qualitative-research-figure.png",
    alt: "Framework of workplace racial microaggressions: environmental factors, stereotypes of Black women, assumed universality of the Black experience, invisibility, and exclusion lead to perceptions of microaggressions. Perceptions lead to reactions and consequences, which influence each other. Both lead to coping strategies: religion and spirituality, armoring, shifting, support networks, sponsorship and mentorship, and self-care.",
  ),
) <fig:sample-qualitative-research-figure>

== Sample mixed methods research figure
Referencing @fig:sample-mixed-methods-research-figure.

#apa-figure(
  caption: [A Multistage Paradigm for Integrative Mixed Methods Research],
  image(
    "../assets/images/sample-mixed-methods-research-figure.png",
    alt: "Mixed methods framework combining qualitative textual evidence and quantitative numeric evidence across six stages: design, collection, conversion, analysis, interpretation, and integration. Traditionalism (cultural, family, and rural lifestyle) informs open-ended questions and item scales. Recordings and survey responses become thematic categories and codes, followed by content and statistical analyses, interpretation of quotations and models, and integrative conclusions. Axial coding, item analysis, and recontextualization connect the approaches.",
  ),
) <fig:sample-mixed-methods-research-figure>

== Sample illustration of experimental stimuli
Referencing @fig:sample-stimuli.

#apa-figure(
  caption: [Examples of Stimuli Used in Experiment 1],
  image(
    "../assets/images/sample-illustration-experimental-stimuli.png",
    alt: "Two cartoon bees: the left bee has two legs, stripes, one wing on each side, and antennae; the right has six legs, spots, two wings on each side, and no antennae.",
  ),
  note: [
    Stimuli were computer-generated cartoon bees that varied on four binary dimensions, for a total of 16 unique stimuli. They had two or six legs, a striped or spotted body, single or double wings, and antennae or no antennae. The two stimuli shown here demonstrate the use of opposite values on all four binary dimensions.
  ],
) <fig:sample-stimuli>

== Sample map
Referencing @fig:sample-map

#apa-figure(
  caption: [Poverty Rate in the United States, 2017],
  image(
    "../assets/images/sample-map.png",
    alt: "Poverty rates by state, the District of Columbia, and Puerto Rico. Darker shading indicates higher rates in five bands, from below 11 percent to at least 18 percent. The highest band includes New Mexico, Louisiana, Mississippi, West Virginia, and Puerto Rico. The national rate is 13.4 percent.",
  ),
  note: [
    Adapted from 2017 Poverty Rate in the United States, by U.S. Census Bureau, 2017 (#link("https://www.census.gov/library/visualizations/2018/comm/acs-poverty-map.html")). In the public domain.
  ],
) <fig:sample-map>
