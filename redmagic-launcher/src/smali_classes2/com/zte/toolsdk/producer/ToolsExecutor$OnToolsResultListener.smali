.class public interface abstract Lcom/zte/toolsdk/producer/ToolsExecutor$OnToolsResultListener;
.super Ljava/lang/Object;
.source "ToolsExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/producer/ToolsExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnToolsResultListener"
.end annotation


# virtual methods
.method public abstract onResult(Ljava/lang/String;Ljava/lang/String;Z)V
.end method

.method public abstract onResultByToolsParams(Lcom/zte/toolsdk/producer/ToolsParams;)V
.end method
