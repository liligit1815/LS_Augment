"""Check the real OEM producer, operation and transport contracts for six Magic Island scenes."""
import argparse
import hashlib
import importlib.util
import json
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('dex',ROOT/'tools/check-launcher-module-targets.py')
dex=importlib.util.module_from_spec(spec);spec.loader.exec_module(dex)
SDK='Lcom/zte/toolsdk/'
MESSAGE=SDK+'common/CardMessage;'
REMOTE=SDK+'widget/RemoteViews;'
CTX='Landroid/content/Context;'
STR='Ljava/lang/String;'
CONT='Lkotlin/coroutines/Continuation;'

def check(path,kind):
    classes,resources=dex.read_apk(path);checked=[];missing=[]
    def req(owner,member,static=False,field=False):
        checked.append(owner+'->'+member)
        value=dex.find_member(classes,owner,'fields' if field else 'methods',member)
        if not value or bool(value[1]&8)!=static or not field and value[1]&1024:missing.append(checked[-1])
    def method(owner,name,result='V',args='',static=False):req(owner,name+'('+args+')'+result,static)
    pusher=SDK+'producer/CardPusher;'
    req(pusher,'mContext:'+CTX,field=True);req(pusher,'mTargetPackage:'+STR,field=True)
    method(pusher,'connect','Z');method(pusher,'isConnected','Z');method(pusher,'disconnect')
    for name in ['pushCard','updateCard']:method(pusher,name,'Z',MESSAGE)
    method(pusher,'removeCard','Z',STR)
    method(pusher,'setOnCardMessageActionListener',args=SDK+'producer/CardPusher$OnCardMessageActionListener;')
    method(MESSAGE,'getCardId',STR)
    if kind=='record':
        owner='Lcn/zte/recorder/common/helper/CardPusherHelper;';card=owner[:-1]+'$CardType;'
        method(owner,'updateCard',args=card+owner[:-1]+'$RecordState;JZZ',static=True)
        method(owner,'removeCard',args=card,static=True)
        method(owner,'setCardActionListener',args=owner[:-1]+'$CardActionListener;',static=True)
        method('Lcn/zte/recorder/common/config/CommonConfig;','supportFullScreenLiveIsland','Z',static=True)
    elif kind=='call':
        owner='Lcom/android/incallui/zte/island/IslandCardManager;'
        for name in ['createSmallRemoteViews','createLargeRemoteViews','createMiniRemoteViews']:method(owner,name,REMOTE)
        method(owner,'handleSmallIslandClick');method(owner,'handleLargeIslandClick',args='I');method(owner,'removeAllCards')
    elif kind=='translation':
        owner='Lcom/zte/nebulatranslation/ui/IslandManager;'
        method(owner,'notify','Ljava/lang/Object;',STR+MESSAGE+CONT);method(owner,'cancel','Ljava/lang/Object;',STR+CONT)
        method(owner,'setCardMessageActionListener',args=SDK+'producer/CardPusher$OnCardMessageActionListener;')
        for factory in ['Transcription','CallAssistant']:
            method('Lcom/zte/nebulatranslation/domain/'+factory+'IslandCardMessageFactory;','create','Ljava/lang/Object;',
                   'Lcom/zte/nebulatranslation/data/entity/IsLandCardData;'+CONT)
    elif kind=='nfc_transfer':
        owner='Lcom/zte/multscr/nfc/NfcFileTransCardMgr;'
        for name,args in [('pushOrUpdateCard',CTX+MESSAGE),('handleCardAction',CTX+'I'),('removeCard',STR+'Ljava/util/List;'),
            ('showProgressCard',CTX+'Ljava/lang/Integer;ZZ'),('showSucceedCard',CTX+STR+'Z'),('showFailedCard',CTX+STR+'Z'),
            ('showWaitReceiveCard',CTX+'Z'),('showRefusedCanceledCard',CTX+'ZZZ'),('showAcceptOrNotCard',CTX),('showIosConnectingCard',CTX)]:method(owner,name,args=args)
    elif kind=='ai_memory':
        prefix='Lcom/zte/zmemory/foundation/card/';info=prefix+'CardInfo;'
        method(prefix+'BaseCardPusher;','pushCard','Z',info)
        method(prefix+'BaseCardPusher;','removeCardImmediately',info,STR)
        method(prefix+'BaseCardPusher;','handleCardClickInternal',args=STR+'I')
        req(prefix+'BaseCardPusher;','FIXED_ISLAND_CARD_ID:'+STR,True,True)
        for name in ['createLargeCard','createSmallCard','createMiniCard']:method(prefix+'CardIslandPusher;',name,REMOTE,info)
        method(prefix+'CardIslandPusher;','onCardClick','Z',info)
        for name,count in [('pushProcessingCard',3),('pushSuccessCard',4),('pushFailedCard',2),('pushCancelledCard',1)]:
            method(prefix+'ClickFavoriteCardPusher;',name,args=STR*count)
        pipe='Lcom/zte/zmemory/memorycore/generation/'
        source=pipe+'pipeline/source/ClickFavoritePipelineSource;';operator=pipe+'operator/production/ClickFavoriteIslandNotifyOperator;'
        req(source,'cardPusher:'+prefix+'ClickFavoriteCardPusher;',field=True)
        req(operator,'notifier:'+prefix+'ClickFavoriteCardPusher;',field=True)
        req(prefix+'ClickFavoriteCardPusher;','mContext:'+CTX,field=True)
        method(source,'getPending','Ljava/util/List;','I');method(operator,'process','Ljava/util/List;','Ljava/util/List;')
        method(pipe+'IShortTermToLongTermPipeline$RawData;','getMetadata',STR,STR)
        method(prefix+'CardIslandPusher;','getInstance',prefix+'CardIslandPusher;',CTX,True)
        method(prefix+'CardIslandPusher;','init','Z');method(prefix+'CardIslandPusher;','getCardInfo',info,STR)
        method(info,'getStatus','I');method(info,'getJumpExtras','Landroid/os/Bundle;')
    return dict(kind=kind,apk=str(path),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),checked=checked,
                missing=missing,passed=not missing,evidence='OEM DEX signatures only; no device/business acceptance')

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--firmware',type=Path,required=True);parser.add_argument('--output',type=Path,required=True)
    args=parser.parse_args()
    apks={'record':'system_b/system/app/Recorder_MFV/Recorder_MFV.apk','call':'system_b/system/priv-app/Dialer_MFV/Dialer_MFV.apk',
          'translation':'system_b/system/priv-app/NebulaTranslation_RedMagicDomesticPhone/NebulaTranslation_RedMagicDomesticPhone.apk',
          'nfc_transfer':'system_b/system/priv-app/MultiScreenCollaboration/MultiScreenCollaboration.apk',
          'ai_memory':'system_b/system/priv-app/AiKnowledge/AiKnowledge.apk'}
    results=[]
    for kind,relative in apks.items():
        result=check(args.firmware/relative,kind);results.append(result)
        print(kind,'PASS' if result['passed'] else 'FAIL',len(result['checked']),'contracts',result['missing'],flush=True)
    args.output.write_text(json.dumps(results,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    if any(not r['passed'] for r in results):raise SystemExit(1)
