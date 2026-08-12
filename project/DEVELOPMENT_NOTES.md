# Development Notes

## Project Context

- Michael maintains this project.
- Follow `/home/webuser/.project/AGENTS.md` and `/home/webuser/.project/DEVELOPMENT_PREFERENCES.md`.
- Keep this file current when architectural decisions, unfinished work, known issues, deployment requirements, warnings, or open questions are discovered.
- Phase 1 project management TODOs are tracked in `/var/www/.projectmanagement/TODO.md`.

## Known Issues

- 2026-06-01: This file was referenced by the project instructions but did not exist at session start. It has been created to restore the expected workflow.

## Architectural Decisions

- 2026-06-01: Module progress is persisted separately from individual question answers in `user_module_progress`. Question answers remain the source for per-question history, while module progress stores durable status, score, attempt count, activity timestamps, and total elapsed time for progress summaries/unlocking.
- 2026-06-01: Learner dashboard and course reports are calculated by `App\Services\LearningProgressService`, not in Blade views. Phase 1 progress rules are: no answers/progress row means not started, answers or a progress row means in progress, completed module progress means completed, and course percentage is completed modules divided by total modules.
- 2026-06-01: Generated training modules that do not have persisted question rows save module-level results through `POST /practice/modules/{module}/result`. The endpoint stores score, attempt count, elapsed time, and in-progress/completed status in `user_module_progress`.
- 2026-06-01: Generated training modules also write individual attempts to `user_practice_question_answers` with `practice_question_id = null`, `practice_module_id`, `answer_source = generated`, prompt, selected answer, correct answer, and correctness. Fixed catalog questions still use `practice_question_id` and `answer_source = catalog`.
- 2026-06-01: Legacy practice routes such as `/practice/math/turboarithmetics` must resolve their seeded `PracticeModule` by `view_name` and pass it into the Blade view; otherwise frontend trainers render without progress endpoints and cannot persist answers.
- 2026-06-01: Generated math modules only become completed after persisted generated answers show more than 100 correct answers and an overall generated-answer score greater than 80%. The backend enforces this in `PracticeModuleProgressService`; frontend thresholds are only hints.

## Unfinished Work

- 2026-06-01: `/var/www/.projectmanagement/TODO.md` says TODO-1, TODO-2, TODO-3, and TODO-4 are implemented. The next major build item is `TODO-5: Fill The Missing Phase 1 Learning Areas And Content`.
- Remaining operational requirement from TODO-1: real Pro Stripe product/price IDs still need to be configured before Pro checkout can be enabled.

## Deployment Requirements

- 2026-06-01: Run `php artisan migrate` before deploying TODO-3 so the `user_module_progress` table exists.
- 2026-06-01: Run `php artisan migrate` after the generated-answer persistence fix so `user_practice_question_answers` can store generated module attempts.
- 2026-06-01: Rebuild frontend assets with `npm run build` after TODO-3 because learning-track, Sudoku, and Minesweeper JavaScript changed.
- 2026-06-01: Rebuild frontend assets with `npm run build` after TODO-4 because dashboard/report Blade changes were verified against the current Vite build manifest.
- 2026-06-01: Rebuild frontend assets with `npm run build` after the generated-training persistence fix because math trainer JavaScript now posts progress results.
- 2026-06-01: Rebuild frontend assets with `npm run build` after changing generated math completion thresholds because trainer JavaScript now waits for 101 correct answers before sending completion intent.

## Questions For Michael

- No open questions recorded yet.
