import { test } from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { writeFileSync, unlinkSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { join } from 'node:path';
import { tmpdir } from 'node:os';

const packageDir = fileURLToPath(new URL('../../versatile-apa/', import.meta.url));
const fixture = join(packageDir, '.authorship-check-' + process.pid + '.typ');
const output = join(tmpdir(), 'apa-authorship-check-' + process.pid + '.pdf');

function compile(source) {
  try {
    writeFileSync(fixture, source);
    const result = spawnSync('typst', ['compile', '--root', packageDir, fixture, output], { encoding: 'utf8' });
    if (result.error) throw result.error;
    return result;
  } finally {
    for (const file of [fixture, output]) if (existsSync(file)) unlinkSync(file);
  }
}

const prefix = '#import "lib/authorship.typ": normalize-authorship\n';
const valid = [
  ['single_content_shared_affiliation', '[Alex]', '[University]', '#assert.eq(data.authors.len(), 1)\n#assert.eq(data.affiliations.first().name, [University])\n#assert(not data.numbered)'],
  ['single_string_shared_affiliation', '"Alex"', '"University"', '#assert.eq(data.authors.first().name, "Alex")\n#assert(not data.numbered)'],
  ['author_list_shares_affiliation', '([Alex], "Taylor")', '[University]', '#assert.eq(data.authors.len(), 2)\n#assert.eq(data.affiliations.len(), 1)\n#assert(not data.numbered)'],
  ['author_record_resolves_dictionary_id', '(name: [Alex], affiliations: "a")', '(a: [University])', '#assert.eq(data.authors.first().affiliations, ("a",))\n#assert(not data.numbered)'],
  ['author_dictionary_assigns_distinct_affiliations', '(alex: (name: [Alex], affiliations: "a"), taylor: (name: [Taylor], affiliations: ("a", "b")))', '(a: [Education], b: [Psychology])', '#assert(data.numbered)\n#assert.eq(data.authors.last().affiliations, ("a", "b"))\n#assert.eq(data.affiliations.last().number, 2)'],
  ['shared_sets_ignore_id_order', '((name: [Alex], affiliations: ("a", "b")), (name: [Taylor], affiliations: ("b", "a")))', '(a: [Education], b: [Psychology])', '#assert(not data.numbered)'],
  ['unused_affiliation_not_printed', '(name: [Alex], affiliations: "a")', '(a: [Education], b: [Unused])', '#assert.eq(data.affiliations.len(), 1)\n#assert.eq(data.affiliations.first().id, "a")'],
  ['unassigned_author_stays_unassigned', '((name: [Alex], affiliations: "a"), (name: [Taylor]))', '(a: [Education])', '#assert(data.numbered)\n#assert.eq(data.authors.last().affiliations, ())'],
  ['omitted_authors_are_allowed', 'none', 'none', '#assert.eq(data.authors, ())\n#assert.eq(data.affiliations, ())'],
];
for (const [name, authors, affiliations, checks] of valid) test(name, () => {
  const result = compile(prefix + '#let data = normalize-authorship(' + authors + ', ' + affiliations + ')\n' + checks);
  assert.equal(result.status, 0, result.stderr);
});

const invalid = [
  ['missing_author_name_explains_record_shape', '((affiliations: "a"),)', '(a: [Education])', 'each author record needs a name'],
  ['empty_author_name_rejected', '" "', 'none', 'name must not be empty'],
  ['empty_author_list_rejected', '()', 'none', 'provide at least one author'],
  ['single_affiliation_cannot_resolve_ids', '(name: [Alex], affiliations: ("a", "b"))', '[University]', 'provide a dictionary mapping those IDs'],
  ['missing_affiliations_cannot_resolve_ids', '(name: [Alex], affiliations: "a")', 'none', 'provide a dictionary mapping those IDs'],
  ['unknown_id_rejected_even_without_superscripts', '(name: [Alex], affiliations: "missing")', '(a: [University])', 'unknown ID "missing"'],
  ['unknown_id_rejected_in_shared_set', '((name: [Alex], affiliations: "missing"), (name: [Taylor], affiliations: "missing"))', '(a: [University])', 'unknown ID "missing"'],
  ['duplicate_author_affiliation_id_rejected', '(name: [Alex], affiliations: ("a", "a"))', '(a: [University])', 'only once per author'],
  ['nonadjacent_duplicate_affiliation_id_rejected', '(name: [Alex], affiliations: ("a", "b", "a"))', '(a: [Education], b: [Psychology])', 'only once per author'],
  ['affiliation_array_explains_dictionary_format', '[Alex]', '([University],)', 'use one affiliation as text/content'],
  ['invalid_affiliation_value_rejected', '[Alex]', '(a: 12)', 'affiliation name must be text or content'],
  ['invalid_affiliation_id_type_rejected', '(name: [Alex], affiliations: (12,))', '(a: [University])', 'affiliation ID must be a nonempty string'],
];
for (const [name, authors, affiliations, message] of invalid) test(name, () => {
  const result = compile(prefix + '#let data = normalize-authorship(' + authors + ', ' + affiliations + ')');
  assert.equal(result.status, 1, result.stderr);
  assert.ok(result.stderr.includes(message), result.stderr);
});

test('formatted_names_and_dictionary_authors_set_document_metadata', () => {
  const result = compile('#import "lib.typ": title-page, versatile-apa\n#set document(title: [Authorship check])\n#show: versatile-apa\n#title-page(authors: (alex: (name: [*Alex*], affiliations: "a")), affiliations: (a: [University]))');
  assert.equal(result.status, 0, result.stderr);
});
