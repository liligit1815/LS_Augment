'use client';
import { useEffect, useRef } from 'react';
import { drawConnectivity } from './current-connectivity-preview';
export function CurrentSystemChrome() {
  const ref = useRef<HTMLCanvasElement>(null);
  useEffect(() => {
    let live = true;
    void document.fonts.ready.then(() => {
      if (!live || !ref.current) return;
      const c = ref.current.getContext('2d')!;
      ref.current.width = 1216;
      ref.current.height = 104;
      c.scale(3.25, 3.25);
      c.fillStyle = '#506d7d';
      c.font = '10px NativeLatin, CurrentDevice';
      c.fillText('14:48癸未周一', 4, 13);
      c.fillText('09.28/八月十八 C:37° B:31.0° G:35°', 4, 24);
      c.fillText('ᛒ ▥ 0K', 305, 13);
      c.font = '8px NativeLatin, CurrentDevice';
      c.fillText('I:245mA P:1.0W 2K', 262, 24);
      drawConnectivity(c, 344, 3, 26, {
        ls_augment_statusbar_connectivity_upper_content: 'wifi',
        ls_augment_statusbar_connectivity_middle_content: 'battery',
      });
    });
    return () => {
      live = false;
    };
  }, []);
  return <canvas ref={ref} className="c-system-chrome" aria-hidden="true" />;
}
