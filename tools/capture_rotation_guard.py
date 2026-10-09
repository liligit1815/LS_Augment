"""Pure guards for the opt-in capture rotation test. No device transport."""
import re

class KnownGeometryPending(RuntimeError):
    """Known full-display owner, but sequential PNG/WM geometry is transitional."""

def launch_receipt(raw,expected):
    statuses=re.findall(r'(?m)^Status:\s*(\S+)\s*$',str(raw))
    activities=re.findall(r'(?m)^Activity:\s*(\S+)\s*$',str(raw))
    if statuses!=['ok'] or len(activities)!=1 or re.search(r'(?im)^\s*(?:Error|Exception):',str(raw)):
        raise RuntimeError('Missing/failed exact activity launch receipt; no retry or capture')
    value=activities[0]
    if not re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+',value):raise RuntimeError('Invalid launch receipt component')
    package,activity=value.split('/')
    actual=package+'/'+(package+activity if activity.startswith('.') else activity)
    if actual!=expected:raise RuntimeError('Launch receipt returned a different activity; no retry or capture')
    return actual

def physical_rotation(raw):
    displays=re.findall(r'(?m)^\s*Display: mDisplayId=(\d+)\b',raw)
    if displays!=['0']:raise RuntimeError('Expected exactly primary display0')
    found=re.findall(r'(?m)^\s*mRotation=([0-3]) mDeferredRotationPauseCount=\d+',raw)
    if len(found)!=1 or found[0] not in ('0','1'):raise RuntimeError('Unknown primary physical rotation')
    return found[0]

def focused_component(raw):
    found=re.findall(r'mCurrentFocus=Window\{[^\n}]*?\bu0\s+([^\s}]+)\s*\}',raw)
    if len(found)!=1 or not re.fullmatch(r'[A-Za-z][\w.]+/[\w.$]+',found[0]):raise RuntimeError('Unknown native focused component')
    package,activity=found[0].split('/')
    return package+'/'+(package+activity if activity.startswith('.') else activity)

def initial(native,actual):
    if native.get('auto')!='0' or native.get('user')!='0' or actual!='0':raise RuntimeError('Rotation case requires original auto0/user0/physical0')
    return {'original':'0','confirmed':'0','inflight':None,'history':[],'restored':False,'observersFinished':False}

def owned(state,value):
    pending=state.get('inflight')
    allowed={state['confirmed']}
    # A durable intent alone does not prove that the settings transport ran.
    if pending and pending.get('transportCalled') is True:allowed.update([pending['before'],pending['target']])
    return value in allowed

def require_owned(state,native):
    pending=state.get('inflight')
    if state.get('original')!='0' or state.get('confirmed') not in ('0','1'):
        raise RuntimeError('Invalid native rotation ownership journal')
    if pending and (pending.get('before')!=state['confirmed'] or pending.get('target') not in ('0','1') or type(pending.get('transportCalled')) is not bool):
        raise RuntimeError('Invalid native rotation inflight ownership')
    if native.get('auto')!='0' or native.get('user') not in ('0','1') or not owned(state,native.get('user')):
        raise RuntimeError('External/unknown native rotation; preserve current value')

def target_ready(observation,target,component):
    return (observation['component']==component and observation['actual']==str(target)
        and observation['native']=={'auto':'0','user':str(target)}
        and (observation['size'][0]>observation['size'][1])==(str(target)=='1'))
