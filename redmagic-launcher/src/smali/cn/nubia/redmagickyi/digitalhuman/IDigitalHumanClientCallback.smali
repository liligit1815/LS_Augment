.class public interface abstract Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback;
.super Ljava/lang/Object;
.source "IDigitalHumanClientCallback.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$_Parcel;,
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Stub;,
        Lcn/nubia/redmagickyi/digitalhuman/IDigitalHumanClientCallback$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "cn.nubia.redmagickyi.digitalhuman.IDigitalHumanClientCallback"


# virtual methods
.method public abstract onHumanInited()V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onMotionStart(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onMotionStop(Lcn/nubia/redmagickyi/digitalhuman/utils/MotionVia;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSpeakStart(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onSpeakStop(Lcn/nubia/redmagickyi/digitalhuman/utils/SpeakVia;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
