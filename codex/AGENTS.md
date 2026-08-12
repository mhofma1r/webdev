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
- Use Jira project `KAN` as the source of truth for planned work, requirements, priorities, and delivery status.
- For an implementation ticket, follow this lifecycle:
  1. Read the ticket and acceptance criteria before changing code.
  2. Assign it to the dedicated Jira user `Codex` before implementation starts.
  3. Move it to `In Progress` when implementation starts.
  4. Implement and verify the acceptance criteria.
  5. Post a concise Jira comment with the change summary, verification results, and a suggested Gitmoji commit message.
  6. Move it to `In Review`; do not move a ticket directly to `Done`.
- Do not use local directories or Markdown files as a parallel project-management backlog or planning workflow. Local technical documentation may be updated only for enduring architecture, deployment, security, or maintenance knowledge.
- keep a log of your activities in /home/webuser/.project/logs/activity.log
- after every completed task you sould consinder if one of the files mentioned in this file needs to be updated.
- when making technical decisions, dont give much waight to development cost
  instead priorize quality and simplicity robustness and maintainability.
- prefere E2E tests over unit tests.
 

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
