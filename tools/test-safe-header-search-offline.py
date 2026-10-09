"""Exercise search-launch false positives and recovery boundaries without ADB."""
import importlib.util,json,tempfile,unittest
from pathlib import Path
P=Path(__file__).resolve().with_name('run-safe-header-search-device.py')
S=importlib.util.spec_from_file_location('search',P);m=importlib.util.module_from_spec(S);S.loader.exec_module(m)

class Cases(unittest.TestCase):
    def windows(self,package='com.android.systemui',button=True):
        child={'id':m.extra.ID+'search_button','visible':True,'bounds':'[10,10][50,50]'}
        header={'id':m.extra.ID+'cc_header','visible':True,'children':[child] if button else []}
        return [{'active':True,'focused':True,'type':1,'root':{'package':package,'children':[{'id':m.extra.ID+'control_panel','visible':True,'children':[header]}]}}]
    def test_panel_requires_actual_focus_not_visible_app(self):
        value=self.windows();value[0]['focused']=False
        with self.assertRaises(m.extra.Inconclusive):m.control(value)
    def test_unrelated_surface_cannot_supply_matching_id(self):
        with self.assertRaises(m.extra.Inconclusive):m.control(self.windows('ls.augment.com'))
    def test_hidden_button_is_distinct_from_absent_panel(self):
        self.assertIsNone(m.control(self.windows(button=False)))
        with self.assertRaises(m.extra.Inconclusive):m.control([])
    def test_duplicate_controls_never_tapped(self):
        value=self.windows();header=value[0]['root']['children'][0]['children'][0];header['children']*=2
        with self.assertRaises(m.extra.Inconclusive):m.control(value)
    def test_target_visible_behind_panel_is_not_launch(self):
        value=self.windows();value.append({'type':1,'active':False,'focused':False,'root':{'package':m.APP}})
        state=m.extra.focus_state(value,'mCurrentFocus=Window{aaa u0 com.android.systemui/.Panel}',m.APP)
        self.assertFalse(state['targetFocusedAndPanelGone'])
    def test_launcher_return_after_tap_is_not_launch(self):
        value=[{'type':1,'active':True,'focused':True,'root':{'package':'com.zte.mifavor.launcher'}}]
        self.assertFalse(m.extra.focus_state(value,'mCurrentFocus=Window{aaa u0 com.zte.mifavor.launcher/.Home}',m.APP)['targetFocusedAndPanelGone'])
    def test_two_focus_sources_and_no_panel_are_required(self):
        value=[{'type':1,'active':True,'focused':True,'root':{'package':m.APP}}]
        self.assertFalse(m.extra.focus_state(value,'mCurrentFocus=Window{aaa u0 com.zte.mifavor.launcher/.Home}',m.APP)['targetFocusedAndPanelGone'])
        self.assertTrue(m.extra.focus_state(value,'mCurrentFocus=Window{aaa u0 ls.augment.com/.SettingsActivity}',m.APP)['targetFocusedAndPanelGone'])
    def test_mutation_scope_and_external_change_preservation(self):
        with tempfile.TemporaryDirectory() as tmp:
            before={m.SEARCH:'0',m.TARGET:'user.browser','foreign':'keep'};p=Path(tmp)/'restore.json';j=m.Journal(p,before,{})
            for values in [{m.TARGET:'arbitrary.app'},{'foreign':'0'},{m.SEARCH:'3'}]:
                with self.assertRaises(ValueError):j.plan(values,before)
            values={m.SEARCH:'1',m.TARGET:m.APP};j.plan(values,before);j.acknowledge(values)
            state=dict(before,**values);state[m.TARGET]='external.browser';writes=[]
            def instrument(op,label,values=None):
                if op=='set':writes.append(values);state.update(values)
                return {'settings':dict(state)}
            with self.assertRaises(RuntimeError):j.restore(instrument,pause=lambda _:None)
            self.assertEqual('external.browser',state[m.TARGET]);self.assertTrue(j.data['pending'])
            self.assertTrue(all(m.TARGET not in write for write in writes))
            with self.assertRaises(ValueError):m.extra.Journal(p)

if __name__=='__main__':unittest.main(verbosity=2)
