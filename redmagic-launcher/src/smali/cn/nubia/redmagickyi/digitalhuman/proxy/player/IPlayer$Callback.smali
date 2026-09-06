.class public interface abstract Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer$Callback;
.super Ljava/lang/Object;
.source "IPlayer.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/nubia/redmagickyi/digitalhuman/proxy/player/IPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract getAvatarHeight()I
.end method

.method public abstract getAvatarLayoutParams(FF)[F
.end method

.method public abstract getAvatarWidth()I
.end method

.method public abstract getBackgroundColor()I
.end method

.method public abstract isModelReady()Z
.end method

.method public abstract isModelRendered()Z
.end method

.method public abstract onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
.end method

.method public abstract setHidden(Z)V
.end method

.method public abstract setModelRendered()V
.end method

.method public abstract surfaceChanged(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;II)V
.end method

.method public abstract surfaceCreated(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
.end method

.method public abstract surfaceDestroyed(Landroid/view/Surface;Lcn/nubia/redmagickyi/digitalhuman/utils/SurfaceType;)V
.end method
