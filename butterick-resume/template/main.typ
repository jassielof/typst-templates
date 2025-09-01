#import "../lib.typ": *

#show: butterick.with(
  title: [John Doe],
  subtitle: [
    Address, City, State

    Phone #h(1em) Email
  ],
  typography: (
    headings: (
      font: "Libertinus Sans",
    ),
    body: (
      font: "Libertinus Serif",
      size: 10pt,
    ),
  ),
)

= education
#education(
  institution: "University of Somewhere",
  period: [2020--24],
  details: [
    - Relevant coursework: Advanced Topics in Computer Science
    - GPA: 3.8/4.0
  ],
)

= business experience
#experience(
  role: "Software Engineer Intern",
  business: "Tech Company",
  period: [2023],
  details: [
    - Developed a web application using React and Node.js
    - Collaborated with cross-functional teams to deliver high-quality software
  ],
)

#experience(
  role: "Junior Developer",
  business: "Another Tech Company",
  period: [2022],
  details: [
    - Assisted in the development of internal tools using Python and Flask
    - Participated in code reviews and contributed to team knowledge sharing
  ],
)

= other work experience
#experience(
  role: "Freelance Web Developer",
  business: "Self-Employed",
  period: [2021--Present],
  details: [
    - Designed and developed websites for small businesses using HTML, CSS, and JavaScript
    - Managed client relationships and ensured project deadlines were met
  ],
)
