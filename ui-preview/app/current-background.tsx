/* eslint-disable nextjs/no-img-element -- Local native assets must retain their measured dimensions; user-selected images are data URLs. */
/** Pixel-verified port of AppearanceController.Background; the page stays real DOM. */
export function CurrentBackground({ opacity = 1 }: { opacity?: number }) {
  return (
    <img
      aria-hidden="true"
      alt=""
      className="c-backdrop"
      src="/current/native-background.png"
      style={{ opacity }}
    />
  );
}
