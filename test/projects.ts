import test from 'ava';

import Projects from '../src/projects';

test('dimensions', t => {
  const projects = new Projects(null);

  t.ok(projects.buildTypes, 'should have buildTypes');
  t.ok(projects.templates, 'should have templates');
});
