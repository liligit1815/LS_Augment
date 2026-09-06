.class public Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;
.super Ljava/lang/Object;
.source "InputChannelCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/shared/system/InputChannelCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NubiaInputEventReceiver"
.end annotation


# instance fields
.field private final mInputChannel:Landroid/view/InputChannel;

.field private final mReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$SysUiInputEventReceiver;


# direct methods
.method public constructor <init>(Landroid/view/InputChannel;Landroid/os/Looper;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;->mInputChannel:Landroid/view/InputChannel;

    .line 5
    .line 6
    new-instance v0, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver$1;

    .line 7
    .line 8
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver$1;-><init>(Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;Landroid/view/InputChannel;Landroid/os/Looper;Lcom/android/systemui/shared/system/InputChannelCompat$InputEventListener;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;->mReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$SysUiInputEventReceiver;

    .line 12
    .line 13
    const-string p0, "SysShared"

    .line 14
    .line 15
    const-string p1, "NubiaInputEventReceiver init success "

    .line 16
    .line 17
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;->mReceiver:Lcom/android/systemui/shared/system/InputChannelCompat$SysUiInputEventReceiver;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/InputEventReceiver;->dispose()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/systemui/shared/system/InputChannelCompat$NubiaInputEventReceiver;->mInputChannel:Landroid/view/InputChannel;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/InputChannel;->dispose()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
