.class public interface abstract Lcom/zte/toolsmanager/IToolsListener;
.super Ljava/lang/Object;
.source "IToolsListener.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/toolsmanager/IToolsListener$Stub;,
        Lcom/zte/toolsmanager/IToolsListener$Default;
    }
.end annotation


# static fields
.field public static final DESCRIPTOR:Ljava/lang/String; = "com.zte.toolsmanager.IToolsListener"


# virtual methods
.method public abstract onAppFunctionsChanged(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method

.method public abstract onAppFunctionsFetchComplete(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
    .end annotation
.end method
