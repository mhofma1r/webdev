# Agent Instructions

This project is maintained by Michael.

## Responsibilities

- Read DEVELOPMENT_NOTES.md at the start of every session.
- Keep DEVELOPMENT_NOTES.md up to date.
- Record architectural decisions.
- Record unfinished work.
- Record known issues.
- Record deployment requirements.
- Never remove information unless it is obsolete.
- /var/www/.projectmanagement is a directory with documents regarding the project from as projectmanagers perspective.
  - it is your task to adheer to the specs within this document as close as it is possible
  - and only change this files in direct correspondance with the user as it is yor responsibility to keep the project on track.
- keep a log of your activities in /home/webuser/.project/logs/activity.log
- after every completed task you sould consinder if one of the files mentioned in this file needs to be updated.
 

## Coding Style

- Use PHP 8.5 features where appropriate.
- Prefer Doctrine ORM.
- Prefer FOSS products to paid products where possible.
- Use Gitmoji commit messages.
- Ask before introducing new dependencies.

## Coding Style

### General Principles

- Write clean, readable, and maintainable code.
- Prefer simplicity over cleverness.
- Keep functions and methods small and focused.
- Avoid code duplication (DRY).
- Use meaningful names for variables, functions, classes, and files.
- Comment **why**, not **what**.
- Remove dead code before committing.

---

### PHP

#### Standards

- Follow PSR-12.
- Follow PSR-4 autoloading.
- Always use:

```php
declare(strict_types=1);
```

- Use type hints for parameters and return values.
- Prefer Dependency Injection over global state or static services.
- Avoid business logic in views/templates.
- Use exceptions for exceptional situations.

#### Example

```php
public function findById(int $id): ?User
{
    return $this->repository->find($id);
}
```

---

### JavaScript

#### Standards

- Prefer `const` over `let`, and `let` over `var`.
- Use strict equality (`===` and `!==`).
- Keep functions focused on a single responsibility.
- Avoid global variables.
- Use descriptive names.
- Prefer modern ES6+ syntax.

#### Example

```javascript
const user = await api.getUser(id);

if (user === null) {
    return;
}
```

---

### HTML

#### Standards

- Use semantic HTML whenever possible.
- Keep markup clean and properly indented.
- Prefer accessibility-friendly elements.
- Use labels for form inputs.
- Avoid inline styles.

#### Example

```html
<main>
    <article>
        <h1>Title</h1>
        <p>Content</p>
    </article>
</main>
```

---

### CSS

#### Standards

- Prefer reusable classes over inline styles.
- Keep selectors simple.
- Avoid `!important` whenever possible.
- Group related styles together.
- Use consistent spacing and naming conventions.

#### Example

```css
.card {
    padding: 1rem;
    border-radius: 0.5rem;
}
```

---

### Security

- Never trust user input.
- Validate and sanitize all incoming data.
- Escape output appropriately.
- Use prepared statements for database queries.
- Protect forms with CSRF tokens.
- Store secrets in environment variables.
- Never commit passwords, API keys, or tokens.

---

### Git

#### Commits

- Create small, focused commits.
- Write meaningful commit messages.
- Use Gitmoji when appropriate.

Example:

```text
✨ Add user profile page

- Add profile controller
- Add profile view
- Add route registration
```

---

### Code Quality

Before committing:

- Run tests.
- Run static analysis.
- Run code formatting tools.
- Remove debug code.
- Review for security issues.

---

### Preferred Architecture

- MVC where appropriate.
- Separate presentation, business logic, and data access.
- Keep controllers thin.
- Place business logic in services.
- Use dependency injection.
- Prefer composition over inheritance.

---

### Golden Rule

Write code as if the next person maintaining it is a tired developer reading it at 3 AM during an outage.

# Projectstructure

## /home/webuser/.project/DEVELOPMENT_PREFERENCES.md:
a file that generally describes my expectations for good code.

## /home/webuser/.project/DEVELOPMENT_NOTES.md:
a file that the agent can use to track important informations documentation and about the project  or questions the 
agent wants Michael to be aware of. if you have one of these please segent them out clearly visible so i can see them 
if i scroll over the file. important limitations.

## /var/www/.projectmanagement/ProjectOutlineTree:
filesystem-backed project outline used for project-manager planning.

- The root is split into `implemented/` and `planned/`.
- `implemented/` contains outline areas that already have a working application foundation.
- `planned/` contains future-facing scope, long-term goals, and items that are not operational yet.
- Heading levels from the original outline are represented as nested folders.
- Every terminal/leaf folder contains exactly one `reqirement.md` file.
- `reqirement.md` contains the requirements, scope notes, descriptions, or feature bullets for that specific area.
- Keep this tree aligned with `/var/www/.projectmanagement/ProjectOutline.md`, `/var/www/.projectmanagement/TODO.md`, and the actual implementation state.
- Do not move items between `implemented/` and `planned/` unless the implementation state or Michael's planning decision justifies it.
- Keep the requested filename spelling `reqirement.md` unless Michael explicitly asks to rename it.
