"""Strict recovery acceptance counterexamples against the actual Controller.

The shared fixture stubs storage, clocks, users and PM transport only. It does not
implement an ownership guard. --controller-source can compile the stage-4 before
snapshot: the five failures must report an actual PM call, not a compile failure.
Passing the conservative current guard does not complete safe restoration.
"""
import argparse
from pathlib import Path
import runpy


CASES = r'''    static void noMutation(HideRecoveryController controller,
            HideRecoveryController.Preview preview,String reason){
        controller.show(preview); // A rejected preview must also remain unusable.
        check(active.pm==0,"UNSAFE PM mutation count="+active.pm+": "+reason);
        check(active.records.isEmpty(),"guard wrote mutation records: "+reason);
    }
    public static void main(String[] args){
        test("prepared-only without an actual module hide cannot restore",()->{
            active.states.put(10,RootHideManager.State.HIDDEN);
            var controller=active.controller();var row=active.historical();
            // The only evidence is PREPARED. No hide command ever ran in this fixture.
            noMutation(controller,controller.preview(row,10),"PREPARED-only is not a module mutation receipt");
            check(active.states.get(10)==RootHideManager.State.HIDDEN,"pre-existing hidden state changed");
        });
        test("observation of no hide cannot be overridden by PREPARED",()->{
            active.states.put(10,RootHideManager.State.HIDDEN);
            var controller=active.controller();var row=active.historical();
            var noHide=journal(entry().observed("VISIBLE",0,false));
            active.sources.put(noHide.key,noHide);
            noMutation(controller,controller.preview(row,10),"matching OBSERVED=VISIBLE proves no observed hide");
            check(active.sources.containsKey(noHide.key),"contradictory evidence removed");
        });
        test("legacy unknown ownership cannot restore a different current user",()->{
            active.fingerprint="unknown";active.states.put(77,RootHideManager.State.HIDDEN);
            var controller=active.controller();var row=active.legacy();
            // Old list says user 10. Merely choosing user 77 cannot establish module ownership.
            noMutation(controller,controller.preview(row,77),"legacy/unknown authority was redirected to user 77");
            check(active.states.get(77)==RootHideManager.State.HIDDEN,"other user's hidden state changed");
            check(active.states.get(0)==RootHideManager.State.VISIBLE&&active.states.get(10)==RootHideManager.State.VISIBLE,"unrelated user changed");
        });
        test("same-state external ABA after review must not be overwritten",()->{
            active.states.put(10,RootHideManager.State.HIDDEN);
            var controller=active.controller();var preview=controller.preview(active.historical(),10);
            // External/manual writers make two real fixture state changes after review.
            active.states.put(10,RootHideManager.State.VISIBLE);
            active.states.put(10,RootHideManager.State.HIDDEN);
            noMutation(controller,preview,"external VISIBLE -> HIDDEN after preview was overwritten");
            check(active.states.get(10)==RootHideManager.State.HIDDEN,"later manual hide changed");
        });
        test("final state check to PM window has no unconditional restore",()->{
            active.states.put(10,RootHideManager.State.HIDDEN);
            var controller=active.controller();var row=active.historical();
            var preview=controller.preview(row,10);int[] clocks={0};
            active.onClock=()->{if(++clocks[0]==4){
                // Before Controller: second revalidate has just read HIDDEN;
                // its final clock read runs immediately before access.show().
                active.states.put(10,RootHideManager.State.VISIBLE);
                active.states.put(10,RootHideManager.State.HIDDEN);
            }};
            active.onPM=()->check(clocks[0]>=4&&active.queries>=3,
                    "last-check race injection was not reached before PM");
            noMutation(controller,preview,"external rehide after the last state read reached unconditional PM");
            // Also exercise a reachable current VISIBLE ticket. A manual hide
            // during its final clock check must never cause a PM compensation.
            active.onClock=()->{};active.states.put(10,RootHideManager.State.VISIBLE);
            var visible=controller.preview(row,10);check(visible.success,visible.message);
            int[] finalClocks={0};active.onClock=()->{if(++finalClocks[0]==2)
                active.states.put(10,RootHideManager.State.HIDDEN);};
            noMutation(controller,visible,"visible-ticket final-check race issued PM");
            check(finalClocks[0]>=2,"visible final-check race was not reached");
            check(active.states.get(10)==RootHideManager.State.HIDDEN,"manual hide overwritten");
        });
        System.out.println("RESULT "+passed+" passed, "+failed+" failed; 0 skipped");
        System.out.println("Acceptance scope: these five invariants reject unsafe PM calls; a no-PM guard alone is not completed recovery.");
        if(failed>0)System.exit(1);
    }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--controller-source', type=Path,
                        help='Production Controller source snapshot for the negative control')
    args = parser.parse_args()
    fixture = runpy.run_path(str(Path(__file__).with_name('test-hide-recovery-controller.py')))
    prefix = fixture['TEST'].split('    public static void main(String[] args){', 1)[0]
    return fixture['run'](args.controller_source, prefix + CASES)


if __name__ == '__main__':
    raise SystemExit(main())
