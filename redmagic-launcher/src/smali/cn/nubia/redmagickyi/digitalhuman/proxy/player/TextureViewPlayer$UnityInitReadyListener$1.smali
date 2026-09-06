.class Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;
.super Ljava/lang/Object;
.source "TextureViewPlayer.java"

# interfaces
.implements Lcn/nubia/redmagickyi/digitalhuman/proxy/player/Counter$OnCounterEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->animIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;


# direct methods
.method constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCounterValueChanged(FZ)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 4
    .line 5
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 6
    .line 7
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$200(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p1, p2}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->onSwitchScene(Ljava/lang/Integer;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 15
    .line 16
    iget-object p1, p1, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 17
    .line 18
    invoke-static {p1}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p1, p2}, Landroid/view/TextureView;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener$1;->this$1:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;

    .line 27
    .line 28
    iget-object p0, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer$UnityInitReadyListener;->this$0:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;

    .line 29
    .line 30
    invoke-static {p0}, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;->access$300(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/TextureViewPlayer;)Landroid/view/TextureView;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/16 p1, 0x8

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/TextureView;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method
