"""Actual WM broker release evidence used by C9 management, with controlled ROM objects."""
from pathlib import Path
import runpy
import tempfile

BASE=runpy.run_path(str(Path(__file__).with_name('test-atomic-workbench-task-broker.py')))
MODELS=BASE['MODELS']
TEST=BASE['TEST'].split(' public static void main(String[]args)',1)[0]+r'''
 static void released(Bundle proof,AtomicWorkbenchTaskOperationRequest request){
  check(request.operationId.equals(proof.get("operation_id"))&&Integer.valueOf(1).equals(proof.get("schema")),"release response lost exact operation");
  check(Boolean.TRUE.equals(proof.get("cleanup_complete"))&&Boolean.FALSE.equals(proof.get("hidden_lease"))&&Boolean.FALSE.equals(proof.get("inherited_hidden_lease")),"hidden responsibility not retired");
  check(Boolean.FALSE.equals(proof.get("cleanup_pending"))&&Boolean.FALSE.equals(proof.get("operation_unconfirmed"))&&"".equals(proof.get("lease_id"))&&"".equals(proof.get("inherited_lease_id")),"partial release certified");
  for(String key:Set.of("mutation_dispatched","external","ended","cancelled"))check(proof.get(key) instanceof Boolean,"missing typed evidence: "+key);
  check(!proof.getBoolean("success"),"cleanup must not masquerade as a newly verified task mutation");
  if(!proof.getBoolean("ended"))check(request.identity.sameTask(AtomicWorkbenchTaskIdentity.fromBundle(proof.getBundle("identity"))),"retired another task generation");
 }
 public static void main(String[]args)throws Throwable{
 test("exact held release emits complete C9 proof and keeps other leases tasks HOME and focus",()->{Fixture f=new Fixture();var first=f.request(f.a,SHELVE);f.apply(first);var second=f.request(f.b,SHELVE);f.apply(second);Object focus=f.zero.mCurrentFocus,root=f.zero.focusedRoot;f.a.mForceHiddenFlags|=8;
  Bundle proof=f.command("release",first.operationId,null);released(proof,first);check(f.a.mForceHiddenFlags==8&&f.b.mForceHiddenFlags==2&&f.home.content==f.one,"release touched foreign hidden bit sibling or HOME");check(f.a.moves==1&&f.a.content==f.zero&&f.a.fronts==0&&f.a.attached&&f.a.mTaskSupervisor.removals==0,"reference release recreated foregrounded or ended task");check(f.zero.mCurrentFocus==focus&&f.zero.focusedRoot==root,"release changed physical focus");});
 test("failed unhide cannot emit complete release and exact retry never moves again",()->{Fixture f=new Fixture();var r=f.request(f.a,SHELVE);f.apply(r);f.a.failUnhide=true;boolean failed=false;try{f.command("release",r.operationId,null);}catch(Exception expected){failed=true;}check(failed&&f.a.mForceHiddenFlags==2&&f.a.moves==1,"failed cleanup lost hidden ownership");f.a.failUnhide=false;released(f.command("release",r.operationId,null),r);check(f.a.moves==1&&f.a.mForceHiddenFlags==0,"cleanup retry replayed migration");});
 test("new owner may only observe inherited cleanup after old exact root death",()->{Fixture f=new Fixture();var r=f.request(f.a,SHELVE);f.apply(r);invoke("watch",new Class<?>[]{Object.class,AtomicWorkbenchSystemRootAuthority.Session.class},f.s,f.owner);f.endpoint.die();f.s.mH.tick();var next=new AtomicWorkbenchSystemRootAuthority.Session();next.endpoint=new Live();next.owner=new Live();next.rootPid=124;next.session=8;f.owner=next;
  released(f.command("query",r.operationId,null),r);check(f.a.moves==1&&f.a.mForceHiddenFlags==0&&f.a.content==f.zero,"old root death left hidden task or new root replayed it");});
 test("UID1000 ordinary leaf application remains releasable",()->{Fixture f=new Fixture();f.a.effectiveUid=1000;var r=f.request(f.a,SHELVE);check(f.apply(r).getBoolean("success"),"UID1000 app blanket rejected");released(f.command("release",r.operationId,null),r);check(f.a.attached&&f.a.mTaskSupervisor.removals==0,"ordinary task ended during reference cleanup");});
 System.out.println("TASK REFERENCE BROKER RESULT "+cases+" cases; "+checks+" assertions");
 }
}'''


def main():
    sources=dict(BASE['SOURCES']);sources['ls/augment/com/hook/TestTaskBroker.java']=TEST
    production=['AtomicWorkbenchTaskIdentity.java','AtomicWorkbenchTaskOperationRequest.java','hook/AtomicWorkbenchTaskOperationHook.java']
    with tempfile.TemporaryDirectory(prefix='duo-c9-reference-broker-') as tmp:
        work=Path(tmp)
        MODELS['compile_run'](work/'base',sources,production,'ls.augment.com.hook.TestTaskBroker')
        controls=[
            ('only exact operation','else if ("release".equals(action)) cleanup(service, op, true);','else if ("release".equals(action)) { for(Operation candidate:OPERATIONS.values()) cleanup(service,candidate,true); }'),
            ('only owned hidden bit','OWN_HIDDEN, false);','-1, false);'),
            ('no hidden lease means actual ack','if ((number(op.task, "mForceHiddenFlags") & OWN_HIDDEN) != 0) throw new IllegalStateException("task_unhide_unconfirmed");','/* skip own hidden ack */'),
            ('root death cleanup','try { cleanup(service, op, true); }','try { /* no death cleanup */ }'),
        ]
        # The ROM adapter throws before clearing on unhide failure; the ack mutation is
        # additionally tested using a successful-but-unapplied setter boundary.
        for i,(label,old,new) in enumerate(controls):
            variant=dict(sources)
            if label=='no hidden lease means actual ack':
                key='ls/augment/com/hook/TestTaskBroker.java'
                variant[key]=variant[key].replace('if(!on&&failUnhide)throw new IllegalStateException("unhide transport");','if(!on&&failUnhide)return true;')
            r=MODELS['compile_run'](work/f'negative-{i}',variant,production,'ls.augment.com.hook.TestTaskBroker',
                replacements={'ls/augment/com/hook/AtomicWorkbenchTaskOperationHook.java':(old,new)},capture=True)
            assert r.returncode!=0 and b'AssertionError' in r.stderr,'broker release negative escaped or compile failed: '+label
            print('PASS reference broker production negative:',label)
        print('TASK REFERENCE BROKER NEGATIVES',len(controls),'passed')


if __name__=='__main__':main()
