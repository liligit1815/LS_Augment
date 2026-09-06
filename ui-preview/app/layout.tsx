import type { Metadata } from 'next';
import './globals.css';
import './preview.css';
export const metadata: Metadata = {icons:{icon:'/boat.png'},title:'LS_Augment · 界面布局预览',description:'浏览模块首页和状态栏设置，调整预览并标注布局。网页操作不会改变手机配置。'};
export default function RootLayout({children}:Readonly<{children:React.ReactNode}>){return <html lang="zh-CN"><body>{children}</body></html>}
