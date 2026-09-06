/** Download only the bundled prototype example; never reads device or server logs. */
import {diagnosticExample} from '../../diagnostic-example';
export function GET(request:Request){
 const params=new URL(request.url).searchParams;
 return new Response(diagnosticExample(params.get('shoulder')==='1',params.get('ai')==='1'),{headers:{'Content-Type':'text/plain; charset=utf-8','Content-Disposition':'attachment; filename="LS_Augment-diagnostics-example.txt"','Cache-Control':'no-store','X-Content-Type-Options':'nosniff'}});
}
