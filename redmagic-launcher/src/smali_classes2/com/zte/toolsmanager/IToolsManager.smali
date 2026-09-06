.class public interface abstract Lcom/zte/toolsmanager/IToolsManager;
.super Ljava/lang/Object;
.source "IToolsManager.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsmanager/IToolsManager$_Parcel;,
        Lcom/zte/toolsmanager/IToolsManager$Stub;,
        Lcom/zte/toolsmanager/IToolsManager$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.zte.toolsmanager.IToolsManager"


# virtual methods
.method public abstract getToolCapabilities()Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getToolCapabilityByFeature(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract getToolsInfoByToolsName(Ljava/lang/String;)Lcom/zte/toolsmanager/ToolsInfo;
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract registerAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;)Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract registerFilterAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract unregisterAppFunctionsListener(Lcom/zte/toolsmanager/IToolsListener;)Z
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
