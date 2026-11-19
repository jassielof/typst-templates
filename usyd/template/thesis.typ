#import "../lib.typ": template, title-page

#show: template.with(
  // The title must match exactly across the Title Page and RECS form.
  // Check spelling, punctuation, and capitalisation for consistency.
  thesis-title: [The Title of this Thesis is Hope],
  // You must use your full legal name exactly in Sydney Student. Do not use shortened names, nicknames, or variations. The name must match the official university record exactly.
  author-name: "Jassiel Ovando",
  // Correct faculty and/or school names must be used.
  //
  faculty: [Faculty of Engineering],
  school: [School of Computer Science],
  // Degree name is accurate (Master of Philosophy, Doctor of Philosophy, etc.)
  academic-degree: [Doctor of Philosophy],
  with-creative-componet: true,
  // Include the year of final submission (this may differ from the year you first submitted your thesis for examination).
  submission-year: datetime.today().year(),
  // Support that you received from the Australian Government, including a Research Training Program Scholarship and/or Research Training Program fee offset, must be acknowledged with the following statement: “This research was supported by The Commonwealth through an Australian Government Research Training Program (RTP) Scholarship DOI https://doi.org/10.82133/C42F-K220."
  // Please note that all domestic students receive a Research Training Program offset scholarship, even if they do not hold a stipend. International students in receipt of a Government RTP scholarship must also use the above statement. Please check your scholarship details.
  // Students in receipt of other relevant funding sources may include the second funding statement if applicable.
)

#{
  set align(center)

  // All domestic students and RTP-funded international students must use the following statement: "This research was supported by The Commonwealth through an Australian Government Research Training Program (RTP) Scholarship DOI: https://doi.org/10.82133/C42F-K220."

  // Students in receipt of all other relevant funding sources should use the following statement if applicable: "This research was supported by Relevant Funding Source"
}
