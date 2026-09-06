.class public abstract Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
.super Ljava/lang/Object;
.source "IPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;,
        Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Type;
    }
.end annotation


# instance fields
.field protected callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;


# direct methods
.method public constructor <init>(Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;->callback:Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract bindView(Landroid/view/ViewGroup;Ljava/lang/Boolean;Z)V
.end method

.method public abstract clearState()V
.end method

.method public abstract hide()V
.end method

.method public abstract onModelReady()V
.end method

.method public abstract onSwitchScene(Ljava/lang/Integer;)V
.end method

.method public abstract refreshBackgroundColor()V
.end method

.method public abstract setZOrderOnTop(Z)V
.end method

.method public abstract show()V
.end method

.method public abstract supportedTouchEvent(Z)V
.end method
