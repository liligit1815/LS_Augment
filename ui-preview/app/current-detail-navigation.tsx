'use client';
import { ChevronRight } from 'lucide-react';
import { useRef, useLayoutEffect } from 'react';
import { canonicalParent, resolveGroup } from './current-hierarchy';
import { navigationTargets } from './current-navigation';
import { editorTitles } from './current-editors';
import { settingTitles } from './current-settings';
import { useModel } from './current-ui';
import assetIcons from './current-status-icons.json';
import { statusDesignTitles } from './current-status-navigation';
function titleFor(route: string) {
  return (
    statusDesignTitles[route] ||
    (
      {
        home: '主页',
        settings: '模块',
        about: '关于',
        extra_dim: '极暗与快捷磁贴',
        status_canvas: '工作表画布',
        status_assets: '素材与字体',
      } as Record<string, string>
    )[route] ||
    (route.startsWith('asset/')
      ? assetIcons.find((icon) => 'asset/' + icon.id === route)?.title ||
        '图标详情'
      : '') ||
    resolveGroup(route)?.section.title ||
    navigationTargets.find((t) => 'target-' + t.id === route)?.title ||
    editorTitles[route] ||
    settingTitles[route] ||
    route
  );
}
export function DetailBreadcrumb({ route }: { route: string }) {
  const path = useRef<HTMLElement>(null);
  useLayoutEffect(() => {
    if (path.current) path.current.scrollLeft = path.current.scrollWidth;
  }, [route]);
  const m = useModel(),
    ancestors: string[] = [],
    visited = new Set([route]);
  let parent = canonicalParent(route);
  while (!visited.has(parent)) {
    ancestors.unshift(parent);
    visited.add(parent);
    if (['home', 'settings', 'about'].includes(parent)) break;
    parent = canonicalParent(parent);
  }
  return (
    <nav ref={path} className="d-breadcrumb" aria-label="页面路径">
      {ancestors.map((item, index) => (
        <span key={item}>
          {index > 0 && <ChevronRight size={12} />}
          <button onClick={() => m.go(item)}>{titleFor(item)}</button>
        </span>
      ))}
      <ChevronRight size={12} />
      <h1 className="d-breadcrumb-current" aria-current="page">
        {titleFor(route)}
      </h1>
    </nav>
  );
}
